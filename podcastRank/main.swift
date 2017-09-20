//
//  main.swift
//  podcastRank
//
//  Created by Justin Purnell on 9/19/17.
//  Copyright © 2017 Justin Purnell. All rights reserved.
//

import Foundation

print("Hello, World!")

func buildURL(mediaType: FeedSettings.MediaType, feedType: String, number: Int, format: FeedSettings.Format, explicit: FeedSettings.Explicit) -> String {
	return "\(FeedSettings.apiBase)\(FeedSettings.countryUS)/\(mediaType.rawValue)/\(feedType)/\(number)/\(explicit.rawValue)\(format.rawValue)"
}

let feed = buildURL(mediaType: .podcasts, feedType: FeedSettings.FeedType.Podcasts.topPodcasts, number: 100, format: .json, explicit: .explicit)


struct Rank: Codable {
	let rank: Int
	let date: Date
	let podcast: PodcastResult.PodcastFeed.Podcast
	func description() -> String {
		return "\(String(rank).padding(toLength: 3, withPad: " ", startingAt: 0)).\t\(podcast.name)\t\(date)"
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
	return ranking
}

let todaysResults = dailyResults()
print(todaysResults[0].description())
