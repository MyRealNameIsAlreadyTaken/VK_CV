//
//  ApplicantAPI.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

struct ApplicantAPI: APIService {
	
	private let networkService: NetworkService
	private let fetchURL = URL(string: "https://firebasestorage.googleapis.com/v0/b/applicant-a0294.appspot.com/o/applicant.json?alt=media&token=20b7d21e-2871-4e0b-9360-2aac8accb419")
	
	init(networkService: NetworkService) {
		self.networkService = networkService
	}
	
	func fetchData(_ completion: @escaping (Result<Data, FetchError>) -> Void) {
		self.fetchURL.map { self.networkService.data(at: $0, completion: completion) }
	}
}
