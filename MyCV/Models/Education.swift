//
//  Education.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

struct Education {
	
	let fieldOfStudy: String
	let qualification: String
	let specialization: String?
	let admissionYear: Int
	let graduationYear: Int
}

extension Education: Decodable {
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: QualificationLevelKeys.self)
		self.fieldOfStudy = try container.decode(.fieldOfStudy)
		self.qualification = try container.decode(.qualification)
		self.specialization = try container.decode(.specialization)
		self.admissionYear = try container.decode(.admissionYear)
		self.graduationYear = try container.decode(.graduationYear)
	}
}
