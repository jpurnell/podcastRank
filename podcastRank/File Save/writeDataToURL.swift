//
//  writeDataToURL.swift
//  podcastRank
//
//  Created by Justin Purnell on 1/24/18.
//  Copyright © 2018 Justin Purnell. All rights reserved.
//

import Foundation
import OSLog

func write(data: Data, to url: URL) -> () {
	let logger = Logger(subsystem: "podastRank > File Save > WriteDataToURL", category: "write")
	do {
		if data.count == 0 {
			logger.error("Data length 0, will not attempt to write")
		} else {
			try data.write(to: url)
		}
	} catch {
		logger.error("Error writing \(data.description, privacy: .public) to \(String(describing: url), privacy: .auto)\n")
	}
}
