//
//  dailyResults.swift
//  podcastRank
//
//  Created by Justin Purnell on 1/29/18.
//  Copyright © 2018 Justin Purnell. All rights reserved.
//

import Foundation

func dailyResults() -> [Rank] {
    let feed = buildURL(mediaType: .podcasts, feedType: FeedSettings.FeedType.Podcasts.topPodcastsV2, number: 100, format: .json, type: .podcast)
    print(feed)
	let podcastData = getData(from: feed)
	let decoder = JSONDecoder()
	decoder.dateDecodingStrategy = .iso8601
    print(String(data: podcastData, encoding: .utf8) )
	let podcasts = try! decoder.decode(PodcastResult.self, from: podcastData).feed?.results
	let date = Date()
	var ranking: [Rank] = []
	for (index, podcast) in podcasts!.enumerated() {
		let rank = Rank(rank: (index + 1), date: date, podcast: podcast)
		ranking.append(rank)
	}
	return ranking
}
