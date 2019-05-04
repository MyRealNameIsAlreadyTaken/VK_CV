//
//  NetworkDataProvider.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

class NetworkDataProvider: DataProviderService {
	
	private let api: APIService
	
	init(with api: APIService) {
		self.api = api
	}
	
	func fetchData(completion: @escaping (Result<Data, FetchError>) -> Void) {
		self.api.fetchData(completion)
	}
}
