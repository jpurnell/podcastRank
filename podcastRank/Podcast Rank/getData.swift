//
//  getData.swift
//  PodcastRanker
//
//  Created by Justin Purnell on 9/19/17.
//  Copyright © 2017 Justin Purnell. All rights reserved.
//

import Foundation

func getData(from urlString: String) -> Data {
	let dataURL = URL(string: urlString)
	var returnData = Data()
	do {
		returnData = try Data.init(contentsOf: dataURL!)
	} catch {
		print("No data at url \(urlString)")
	}
	return returnData
}
