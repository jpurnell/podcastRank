//
//  writeResults.swift
//  podcastRank
//
//  Created by Justin Purnell on 1/29/18.
//  Copyright © 2018 Justin Purnell. All rights reserved.
//

import Foundation
import OSLog

func archive(_ todaysResults: [Rank]) -> () {
	let logger = Logger(subsystem: "podcastRank > Podcast Rank > writeResults", category: "archive")
	let dateFormatter = DateFormatter()
	dateFormatter.dateStyle = .medium
	dateFormatter.timeStyle = .short
	//	let lengthCheck = todaysResults.sorted(by: {$0.podcast.name.count > $1.podcast.name.count})
	logger.info("For \(dateFormatter.string(from: Date()), privacy: .public)")
	var outputString = ""
	for result in todaysResults {
		let url = result.podcast.url
		let genres = result.podcast.genres.map({$0.name}).joined(separator: "\t")
		let rankWithPadding = "\(String(result.rank).leftPadding(toLength: 3, withPad: " "))."
		let author = result.podcast.artistName
		let name = result.podcast.name
		let clickableAuthor = generateExcelLink(for: author, with: result.podcast.artistUrl?.absoluteString)
		let clickableName = generateExcelLink(for: name, with: url.absoluteString)
		outputString += "\(rankWithPadding)\t\(clickableAuthor)\t\(clickableName)\t\(genres)\n"
		let printString = "\(rankWithPadding)\t\(author)\t\(name)"
		logger.log("\(printString, privacy: .public)")
	}
	let exportFormatter = DateFormatter()
	exportFormatter.dateStyle = .medium
	let fileName = "Top \(todaysResults.count) for \(exportFormatter.string(from: Date()))"
	do {
		try generateDirectory(for: Preferences.Save.fileDirectory)
	} catch {
		logger.error("Could not generate directory at \(Preferences.Save.fileDirectory, privacy: .auto)")
	}
	do {
		let fileURL = try generateURLFor(fileName: fileName)
		let exportData = outputString.data(using: .unicode, allowLossyConversion: false)
		write(data: exportData!, to: fileURL)
	} catch {
		logger.error("Could not generate url for \(fileName, privacy: .auto)")
	}
}
