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
	private let fetchURL = URL(string: "https://firebasestorage.googleapis.com/v0/b/applicant-a0294.appspot.com/o/applicant.json?alt=media&token=3a5afdf2-e610-4ed7-936f-78c41a80184f")
	
	init(networkService: NetworkService) {
		self.networkService = networkService
	}
	
	func fetchData(_ completion: @escaping (Result<Data, FetchError>) -> Void) {
		self.fetchURL.map { self.networkService.data(at: $0, completion: completion) }
	}
}
