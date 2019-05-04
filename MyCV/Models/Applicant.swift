//
//  Applicant.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

struct Applicant {
	
	enum Degree: String {
		case bachelor = "Bachelor's Degree"
		case master = "Master's Degree"
	}
	
	var imageLoadService: ImageLoadService?
	
	let fullName: String
	let profileImageURL: URL
	let phoneNumber: String
	let emailAddress: String
	
	let education: [Degree: Education]
	
	let programmingLanguages: [String]
	let technologies: [String]
	let workSamples: [String: URL]
	
	let aboutInfo: [String]
	
	func loadProfileImage(completion: @escaping (UIImage?) -> Void) {
		self.imageLoadService?.fetchImage(url: self.profileImageURL) { image in
			completion(image)
		}
	}
}
