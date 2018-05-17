//
//  leftPadding.swift
//  podcastRank
//
//  Created by Justin Purnell on 1/29/18.
//  Copyright © 2018 Justin Purnell. All rights reserved.
//

import Foundation

extension String {
	func leftPadding(toLength: Int, withPad character: Character) -> String {
		let newLength = self.count
		if newLength < toLength {
			return String(repeatElement(character, count: toLength - newLength)) + self
		} else {
			return String(self.prefix(toLength))
		}
	}
}
