//
//  NetworkService.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

protocol NetworkService {
	
	func data(at url: URL, completion: @escaping (Result<Data, FetchError>) -> Void)
}
