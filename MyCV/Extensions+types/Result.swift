//
//  Result.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

enum Result<Value, Error: Swift.Error> {
	
	case success(Value)
	case failure(Error)
	
	var value: Value? {
		switch self {
		case .failure: return nil
		case let .success(value): return value
		}
	}
	
	init(value: Value?, error: Error?, `default`: Error) {
		self = .materialize(value: value, error: error, default: `default`)
	}
	
	private static func materialize(value: Value?, error: Error?, `default`: Error) -> Result  {
		switch (value, error) {
		case let (_, error?): return .failure(error)
		case let (value?, nil): return .success(value)
		default: return .failure(`default`)
		}
	}
}

extension Result where Value == Data {
	
	func decoded<T: Decodable>(with decoder: JSONDecoder = .init()) -> T? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		
		decoder.dateDecodingStrategy = .formatted(dateFormatter)
		
		guard let data = self.value else { return nil }
		return try? decoder.decode(T.self, from: data)
	}
}
