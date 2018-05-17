//
//  PodcastResult.swift
//  PodcastRanker
//
//  Created by Justin Purnell on 9/19/17.
//  Copyright © 2017 Justin Purnell. All rights reserved.
//

import Foundation

struct PodcastResult: Codable {
	let feed: PodcastFeed
	
	struct PodcastFeed: Codable {
		let author: AuthorResult
		let copyright: String
		let country: String
		let icon: String
		let id: String
		let results: [Podcast]
		let title: String
		let updated: String
		
		struct AuthorResult: Codable {
			let name: String?
			let uri: String?
		}
		
		struct Genre: Codable {
			let genreId: String
			let name: String
			let url: URL
		}
		
		struct Podcast: Codable {
			let artistId: String?
			let artistName: String
			let artistUrl: URL?
			let artworkUrl100: URL
			let copyright: String?
			let contentAdvisoryRating: String?
			let genres: [Genre]
			let id: String
			let kind: String
			let name: String
			let primaryGenreName: String?
			let releaseDate: String
			let trackCensoredName: String?
			let trackExplicitness: String?
			let url: URL
			let version: String?
			
			func fullDescription() -> String {
				return "\t\(name)"
			}
		}
	}
}
