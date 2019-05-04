//
//  ImageDownsampler.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

class ImageDownsampler: ImageDownsampleService {
	
	private let options: [CFString: Any] = [kCGImageSourceThumbnailMaxPixelSize: 300,
											kCGImageSourceCreateThumbnailFromImageAlways: true]
	func getImage(from url: URL) -> UIImage? {
		let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil)
		
		return self.imageFrom(imageSource)
	}
	
	func getImage(from data: Data) -> UIImage? {
		let imageSource = CGImageSourceCreateWithData(data as CFData, nil)
		
		return self.imageFrom(imageSource)
	}
	
	private func imageFrom(_ imageSource: CGImageSource?) -> UIImage? {
		return imageSource
			.flatMap { CGImageSourceCreateThumbnailAtIndex($0, 0, self.options as CFDictionary) }
			.map { UIImage(cgImage: $0) }
	}
}
