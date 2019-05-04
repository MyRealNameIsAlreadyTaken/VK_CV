//
//  CacheManager.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

enum ApplicantCacheKeys: String, LocalResourceKey {
	
	case applicant
	case profileImage
}

class CacheManager: CacheService {
	
	private let baseURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
	
	func dataExists(for key: LocalResourceKey) -> Bool {
		let url = baseURL.appendingPathComponent(key.rawValue)
		do {
			let _ = try Data(contentsOf: url)
			return true
		} catch {
			return false
		}
	}
	
	func data(for key: LocalResourceKey) -> Data? {
		let url = baseURL.appendingPathComponent(key.rawValue)
		do {
			return try Data(contentsOf: url)
		} catch {
			return nil
		}
	}
	
	func save(data: Data, for key: LocalResourceKey) {
		if !self.dataExists(for: key) {
			let url = baseURL.appendingPathComponent(key.rawValue)
			do {
				try data.write(to: url)
			} catch {
				fatalError(error.localizedDescription)
			}
		}
	}
	
}
