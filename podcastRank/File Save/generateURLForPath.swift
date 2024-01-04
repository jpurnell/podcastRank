//
//  generateURLForPath.swift
//  podcastRank
//
//  Created by Justin Purnell on 1/24/18.
//  Copyright © 2018 Justin Purnell. All rights reserved.
//

import Foundation
import OSLog

func generateURLFor(fileName: String, to path: String = Preferences.Save.fileDirectory, format: String = ".tsv") throws -> URL {
	let logger = Logger(subsystem: "podcastRank > File Save > Generate URL for Path", category: "generateURLFor")
	
	let fileURLString = path + fileName + format
	let fileURL = URL(fileURLWithPath: fileURLString)
	logger.info("Wrote \(fileName + format, privacy: .public) to \(path, privacy: .auto)")
	return fileURL
}
