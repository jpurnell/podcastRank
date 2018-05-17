//
//  Rank.swift
//  podcastRank
//
//  Created by Justin Purnell on 1/29/18.
//  Copyright © 2018 Justin Purnell. All rights reserved.
//

import Foundation

struct Rank: Codable {
	let rank: Int
	let date: Date
	let podcast: PodcastResult.PodcastFeed.Podcast
	func description() -> String {
		return "\(String(rank).leftPadding(toLength: 3, withPad: " ")).\t\(podcast.name)\t\(date)"
	}
}
