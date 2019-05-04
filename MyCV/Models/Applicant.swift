//
//  Applicant.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

// TODO: - It's good to have id for a profileImage
// This way, when id is changed in API, we know that we need to download new image, even if we have cache
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

extension Applicant: Decodable {
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(
			keyedBy: ApplicantKeys.self)
		self.fullName = try container.decode(.fullName)
		self.profileImageURL = try container.decode(.profileImageURL)
		self.workSamples = try container.decode(.workSamples)
		
		let educationContainer = try container.nestedContainer(
			keyedBy: ApplicantKeys.EducationKeys.self,
			forKey: .education)
		let bachelorsDegree: Education = try educationContainer.decode(.bachelorsDegree)
		let mastersDegree: Education = try educationContainer.decode(.mastersDegree)
		self.education = [.bachelor: bachelorsDegree, .master: mastersDegree]
		
		let contactInfoContainer = try container.nestedContainer(
			keyedBy: ApplicantKeys.ContactInfoKeys.self,
			forKey: .contactInfo)
		self.phoneNumber = try contactInfoContainer.decode(.phoneNumber)
		self.emailAddress = try contactInfoContainer.decode(.emailAddress)
		
		let sdSkillsContainer = try container.nestedContainer(
			keyedBy: ApplicantKeys.SDSkillsKeys.self,
			forKey: .softwareDevelopmentSkills)
		self.programmingLanguages = try sdSkillsContainer.decode(.programmingLanguages)
		self.technologies = try sdSkillsContainer.decode(.technologies)
		
		let otherContainer = try container.nestedContainer(
			keyedBy: ApplicantKeys.OhterKeys.self,
			forKey: .other)
		let languages: String = try otherContainer.decode(.languages)
		let personalCharacteristics: [String] = try otherContainer.decode(.personalCharacteristics)
		self.aboutInfo = [languages] + personalCharacteristics
	}
}
