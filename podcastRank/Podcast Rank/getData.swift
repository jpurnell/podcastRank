//
//  getData.swift
//  PodcastRanker
//
//  Created by Justin Purnell on 9/19/17.
//  Copyright © 2017 Justin Purnell. All rights reserved.
//

import Foundation
import OSLog

func getData(from urlString: String) -> Data {
	let logger = Logger(subsystem: "podcastRank > Podcast Rank > getData", category: "getData")
	let dataURL = URL(string: urlString)
	var returnData = Data()
	do {
		returnData = try Data.init(contentsOf: dataURL!)
	} catch {
		logger.error("No data at url \(urlString, privacy: .public)")
	}
	return returnData
}
