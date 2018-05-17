//
//  generateHTMLLink.swift
//  podcastRank
//
//  Created by Justin Purnell on 1/24/18.
//  Copyright © 2018 Justin Purnell. All rights reserved.
//

import Foundation

func generateHTMLLink(for text: String, with url: String) -> String {
	let returnString = "<a href =\"\(url)\">\(text)</a>"
	return returnString
}

func generateExcelLink(for text: String, with url: String?) -> String {
	let returnString = "=HYPERLINK(\"\(url ?? "")\",\"\(text)\")"
	return returnString
}
