//
//  ImageDownsampler.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

class ImageDownsampler: ImageDownsampleService {
	
	func getImage(from url: URL) -> UIImage? {
		let options: [CFString: Any] = [kCGImageSourceThumbnailMaxPixelSize: 300,
										kCGImageSourceCreateThumbnailFromImageAlways: true]
		
		let scaledImage = CGImageSourceCreateWithURL(url as CFURL, nil)
			.flatMap { CGImageSourceCreateThumbnailAtIndex($0, 0, options as CFDictionary) }
			.map { UIImage(cgImage: $0) }
		
		return scaledImage
	}
}
