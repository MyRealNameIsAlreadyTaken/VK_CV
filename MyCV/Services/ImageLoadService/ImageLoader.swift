//
//  ImageLoader.swift
//  MyCV
//
//  Created by Me on 5/5/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

class ImageLoader: ImageLoadService {
	
	private let key: LocalResourceKey
	private let imageDownsampleService: ImageDownsampleService
	private let localDataProvider: LocalDataProvider
	
	init(for key: LocalResourceKey, imageDownsampleService: ImageDownsampleService) {
		self.key = key
		self.imageDownsampleService = imageDownsampleService
		self.localDataProvider = LocalDataProvider(for: key)
	}
	
	func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
		self.localDataProvider.fetchData { result in
			completion(result.value >>= self.imageDownsampleService.getImage)
		}
	}
}
