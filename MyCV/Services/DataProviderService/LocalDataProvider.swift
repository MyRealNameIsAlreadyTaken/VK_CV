//
//  LocalDataProvider.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

class LocalDataProvider: DataProviderService {
	
	private let key: LocalResourceKey
	
	init(for key: LocalResourceKey) {
		self.key = key
	}
	
	func fetchData(completion: @escaping (Result<Data, FetchError>) -> Void) {
		// Based on some data, decide what local source to use: NSCache, Documents dir, UserDefaults etc.
		// Currently only Caches dir is supported
		let cacheManager = CacheManager()
		let data = cacheManager.data(for: self.key)
		DispatchQueue.global(qos: .background).async {
			completion(Result(value: data, error: nil, default: FetchError.unknown))
		}
	}
}
