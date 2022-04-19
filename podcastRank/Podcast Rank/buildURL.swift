//
//  buildURL.swift
//  podcastRank
//
//  Created by Justin Purnell on 1/29/18.
//  Copyright © 2018 Justin Purnell. All rights reserved.
//

import Foundation

func buildURL(mediaType: FeedSettings.MediaType, feedType: String, number: Int, format: FeedSettings.Format, type: FeedSettings.ResultType) -> String {
    return "\(FeedSettings.apiBase)/\(FeedSettings.countryUS)/\(mediaType.rawValue)/\(feedType)/\(number)/\(type.rawValue)\(format.rawValue)"
}
