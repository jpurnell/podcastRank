//
//  BookResult.swift
//  PodcastRanker
//
//  Created by Justin Purnell on 9/19/17.
//  Copyright © 2017 Justin Purnell. All rights reserved.
//

import Foundation

struct BookResult: Codable {
	struct Genre: Codable {
		let genreId: String
		let name: String
		let url: URL
	}
	
	struct Book: Codable {
		let artistId: String
		let artistName: String
		let artistUrl: URL
		let artworkUrl100: URL
		let genres: [Genre]
		let id: String
		let kind: String
		let name: String
		let releaseDate: String
		let url: URL
		func fullDescription() -> String {
			return "\t\(artistName)\t\t\t\(name)\t[\(releaseDate.prefix(4))]"
		}
	}
	
	struct Feed: Codable {
		let title: String
		let id: String
		let copyright: String
		let country: String
		let icon: URL
		let updated: String
		let results: [Book]
	}
	
	let feed: Feed
}
