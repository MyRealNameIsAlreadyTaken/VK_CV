//
//  CVTableViewCell.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

private let aboutAppBulletPoints = [
	"MVC architecture",
	"Services",
	"JSON parsing + Decodable",
	"Custom Views",
	"Data caching",
	"Image downsampling for reduced memory footprint",
	"Custom Operators",
	"Dynamic Type"
]

class CVTableViewCell: UITableViewCell, NibLoading {
	
	@IBOutlet var containerView: UIView?
	@IBOutlet var paragraphView: UIView?
	@IBOutlet var headerLabel: UILabel?
	@IBOutlet var bodyLabel: UILabel?
	@IBOutlet var workSamplesTextView: UITextView?
	
	var model: Applicant? {
		didSet {
			self.fill(with: model)
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		let paragraphViewWidth = self.paragraphView?.bounds.width
		paragraphViewWidth.map { self.paragraphView?.layer.cornerRadius = $0 / 2 }
		
		self.containerView?.layer.cornerRadius = 8
	}
	
	private func fill(with model: Applicant?) {
		DispatchQueue.main.async {
			self.headerLabel?.text = self.reuseIdentifier?.uppercased()
			self.bodyLabel?.text = self.getBodyLabelText(for: self.reuseIdentifier)
			self.workSamplesTextView?.attributedText = self.model?.workSamples.toAttributedString()
		}
	}
	
	private func getBodyLabelText(for reuseIdentifier: String?) -> String? {
		let addParagraphDot = { "• " + $0 }
		
		var output: [String]?
		switch reuseIdentifier {
		case "education":
			output = self.model?.education.map { key, education in
				let startYear = education.admissionYear
				let endYear = education.graduationYear
				
				let degree = key.rawValue
				let specialization = education.specialization ?? education.fieldOfStudy
				
				return "\(startYear)-\(endYear) " + degree + " in " + specialization + " (KNEU)"
			}
			
		case "languages":
			output = self.model?.programmingLanguages
			
		case "technologies":
			output = self.model?.technologies
			
		case "about me":
			output = self.model?.aboutInfo
			
		case "about app":
			output = aboutAppBulletPoints
			
		default:
			return nil
		}
		
		return addParagraphDot <§> output?.joined(separator: "\n• ")
	}
}
