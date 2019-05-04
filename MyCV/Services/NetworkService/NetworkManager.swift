//
//  NetworkManager.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

class NetworkManager: NetworkService {
	
	private let urlSession: URLSession
	
	init(urlSession: URLSession) {
		self.urlSession = urlSession
	}
	
	func data(at url: URL, completion: @escaping (Result<Data, FetchError>) -> Void) {
		let task = self.urlSession.dataTask(with: url) { (data, _, error) in
			DispatchQueue.global(qos: .background).async {
				completion § Result(
					value: data,
					error: error.map { _ in .failed },
					default: FetchError.unknown)
			}
		}
		
		task.resume()
	}
}
