//
//  JSONDecoder.swift
//  MyCV
//
//  Created by Me on 5/5/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

extension JSONDecoder {
	
	public func decode<T: Decodable>(type: T.Type = T.self, from data: Data) throws -> T {
		return try self.decode(T.self, from: data)
	}
}
