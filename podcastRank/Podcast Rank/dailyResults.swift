//
//  dailyResults.swift
//  podcastRank
//
//  Created by Justin Purnell on 1/29/18.
//  Copyright © 2018 Justin Purnell. All rights reserved.
//

import Foundation
import OSLog

func dailyResults() -> [Rank] {
	let logger = Logger(subsystem: "podcastRank > Podcast Rank > dailyResults", category: "dailyResults")
    let feed = buildURL(mediaType: .podcasts, feedType: FeedSettings.FeedType.Podcasts.topPodcastsV2, number: 100, format: .json, type: .podcast)
	logger.log("\(feed, privacy: .public)")
	let podcastData = getData(from: feed)
	let decoder = JSONDecoder()
	decoder.dateDecodingStrategy = .iso8601
	let podcastString = String(data: podcastData, encoding: .utf8)
	logger.log("\(podcastString ?? "", privacy: .public)")
	guard let podcasts = try? decoder.decode(PodcastResult.self, from: podcastData).feed?.results else { 
		logger.error("Could not decode results from podcast Data of length \(podcastData.count, privacy: .public)")
		return [] }
	let date = Date()
	var ranking: [Rank] = []
	for (index, podcast) in podcasts.enumerated() {
		let rank = Rank(rank: (index + 1), date: date, podcast: podcast)
		ranking.append(rank)
	}
	return ranking
}
