//
//  KeyedDecodingContainerExt.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {
	
	public func decode<T: Decodable>(_ key: Key, as type: T.Type = T.self) throws -> T {
		return try self.decode(T.self, forKey: key)
	}
}
