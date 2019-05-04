//
//  DataProviderService.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

enum FetchError: Error {
	case unknown
	case failed
}

protocol DataProviderService {
	
	func fetchData(completion: @escaping (Result<Data, FetchError>) -> Void)
}
