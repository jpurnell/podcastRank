//
//  generateFileURL.swift
//  podcastRank
//
//  Created by Justin Purnell on 1/24/18.
//  Copyright © 2018 Justin Purnell. All rights reserved.
//

import Foundation

func generateFileURL(exportFilePath: String) -> URL {
	let exportFileURL = URL(fileURLWithPath: exportFilePath)
	return exportFileURL
}

