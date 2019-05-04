//
//  CacheService.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

protocol LocalResourceKey {
	
	var rawValue: String { get }
}

protocol CacheService {
	
	func dataExists(for key: LocalResourceKey) -> Bool
	func data(for key: LocalResourceKey) -> Data?
	func save(data: Data, for key: LocalResourceKey)
}
