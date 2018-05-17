//
//  writeDataToURL.swift
//  podcastRank
//
//  Created by Justin Purnell on 1/24/18.
//  Copyright © 2018 Justin Purnell. All rights reserved.
//

import Foundation

func write(data: Data, to url: URL) -> () {
	do {
		if data.count == 0 {
			print("Data length 0, will not attempt to write")
		} else {
			try data.write(to: url)
		}
	} catch {
		print("Error writing \(data.description) to \(String(describing: url))\n")
	}
}
