//
//  DecodingKeys.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

// MARK:- Applicant Keys

enum ApplicantKeys: String, CodingKey {
	case fullName = "full_name"
	case profileImageURL = "profile_image_path"
	case workSamples = "work_samples"
	
	case education
	enum EducationKeys: String, CodingKey {
		case bachelorsDegree = "bachelor's_degree"
		case mastersDegree = "master's_degree"
	}
	
	case contactInfo = "contact_info"
	enum ContactInfoKeys: String, CodingKey {
		case phoneNumber = "phone"
		case emailAddress = "email"
	}
	
	case softwareDevelopmentSkills = "software_development_skills"
	enum SDSkillsKeys: String, CodingKey {
		case programmingLanguages = "programming_languages"
		case technologies
	}
	
	case other
	enum OhterKeys: String, CodingKey {
		case languages
		case personalCharacteristics = "personal_characteristics"
	}
}

// MARK:- Education Keys

enum QualificationLevelKeys: String, CodingKey {
	case fieldOfStudy = "field_of_study"
	case qualification
	case specialization
	case admissionYear = "admission_year"
	case graduationYear = "graduation_year"
}
