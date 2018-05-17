//
//  generateDirectoryForPath.swift
//  podcastRank
//
//  Created by Justin Purnell on 1/24/18.
//  Copyright © 2018 Justin Purnell. All rights reserved.
//

import Foundation

func generateDirectory(for path: String) throws -> () {
	let manager = FileManager.default
	let pathURL = URL(fileURLWithPath: path)
	try manager.createDirectory(at: pathURL, withIntermediateDirectories: true, attributes: nil)
}
