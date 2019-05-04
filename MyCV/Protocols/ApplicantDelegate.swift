//
//  ApplicantDelegate.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

protocol ApplicantDelegate {
	
	func applicant(_ applicant: Applicant, didFinishLoading image: UIImage?)
}
