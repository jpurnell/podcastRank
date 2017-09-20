//
//  main.swift
//  podcastRank
//
//  Created by Justin Purnell on 9/19/17.
//  Copyright © 2017 Justin Purnell. All rights reserved.
//

import Foundation

print("Hello, World!")

extension String {
	func leftPadding(toLength: Int, withPad character: Character) -> String {
		let newLength = self.characters.count
		if newLength < toLength {
			return String(repeatElement(character, count: toLength - newLength)) + self
		} else {
			return self.substring(from: index(self.startIndex, offsetBy: newLength - toLength))
		}
	}
}

func buildURL(mediaType: FeedSettings.MediaType, feedType: String, number: Int, format: FeedSettings.Format, explicit: FeedSettings.Explicit) -> String {
	return "\(FeedSettings.apiBase)\(FeedSettings.countryUS)/\(mediaType.rawValue)/\(feedType)/\(number)/\(explicit.rawValue)\(format.rawValue)"
}

let feed = buildURL(mediaType: .podcasts, feedType: FeedSettings.FeedType.Podcasts.topPodcasts, number: 100, format: .json, explicit: .explicit)


struct Rank: Codable {
	let rank: Int
	let date: Date
	let podcast: PodcastResult.PodcastFeed.Podcast
	func description() -> String {
		return "\(String(rank).leftPadding(toLength: 3, withPad: " ")).\t\(podcast.name)\t\(date)"
	}
}

func dailyResults() -> [Rank] {
	let podcastData = getData(from: feed)
	let jsonString = try! JSONSerialization.jsonObject(with: podcastData, options: .mutableContainers)
	let decoder = JSONDecoder()
	decoder.dateDecodingStrategy = .iso8601
	let podcasts = try! decoder.decode(PodcastResult.self, from: podcastData).feed.results
	let date = Date()
	var ranking: [Rank] = []
	for (index, podcast) in podcasts.enumerated() {
		let rank = Rank(rank: (index + 1), date: date, podcast: podcast)
		ranking.append(rank)
	}
	let lengthCheck = ranking.sorted(by: {$0.podcast.name.count > $1.podcast.name.count})
	print(lengthCheck[1].podcast.name.count)
	return ranking
}

let todaysResults = dailyResults()
let lengthCheck = todaysResults.sorted(by: {$0.podcast.name.count > $1.podcast.name.count})
for result in todaysResults {
	let padAmount = lengthCheck[1].podcast.name.count + 4
	print("\(String(result.rank).leftPadding(toLength: 3, withPad: " ")).\t\(result.podcast.name.padding(toLength: padAmount, withPad: " ", startingAt: 0))\t\(result.date)")
	print(result.description())
}
