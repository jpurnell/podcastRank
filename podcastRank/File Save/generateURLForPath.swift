//
//  generateURLForPath.swift
//  podcastRank
//
//  Created by Justin Purnell on 1/24/18.
//  Copyright © 2018 Justin Purnell. All rights reserved.
//

import Foundation

func generateURLFor(fileName: String, to path: String = Preferences.Save.fileDirectory, format: String = ".tsv") throws -> URL {
	let fileURLString = path + fileName + format
	let fileURL = URL(fileURLWithPath: fileURLString)
	print("Wrote \(fileName) to \(path)")
	return fileURL
}
