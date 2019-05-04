//
//  ImageDownloader.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

class ImageDownloader: ImageLoadService {
	
	private let imageDownsampleService: ImageDownsampleService
	
	init(imageDownsampleService: ImageDownsampleService) {
		self.imageDownsampleService = imageDownsampleService
	}
	
	func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
		completion § self.imageDownsampleService.getImage § url
	}
}
