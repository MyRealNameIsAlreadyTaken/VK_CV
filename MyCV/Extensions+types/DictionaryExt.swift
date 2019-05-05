//
//  DictionaryExt.swift
//  MyCV
//
//  Created by Me on 5/5/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == URL {
	
	func toAttributedString() -> NSAttributedString {
		return self
			.reduce(NSMutableAttributedString()) { (accumulatorString, entry) -> NSAttributedString in
				let (key, value) = entry
				let attrString = NSAttributedString(string: "• " + key + "\n", attributes: [.link: value])
				return accumulatorString + attrString
		}
	}
}
