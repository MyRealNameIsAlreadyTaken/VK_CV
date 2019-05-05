//
//  CVTableViewCell.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

class CVTableViewCell: UITableViewCell, NibLoading {
	
	@IBOutlet var headerLabel: UILabel?
	@IBOutlet var bodyLabel: UILabel?
	@IBOutlet var workSamplesTextView: UITextView?
	
	var model: Applicant? {
		didSet {
			self.fill(with: model)
		}
	}
	
	private func fill(with model: Applicant?) {
		DispatchQueue.main.async {
			self.headerLabel?.text = self.reuseIdentifier?.uppercased()
			self.bodyLabel?.text = self.getBodyLabelText(for: self.reuseIdentifier)
			self.workSamplesTextView?.attributedText = self.model?.workSamples.toAttributedString()
			
			let height = self.workSamplesTextView?.contentSize.height + 15
			self.workSamplesTextView?.isScrollEnabled = false
			let makeWSHeighConstraint = self.workSamplesTextView?.heightAnchor.constraint(equalToConstant:)
			(makeWSHeighConstraint <*> height)?.isActive = true
		}
	}
	
	private func getBodyLabelText(for reuseIdentifier: String?) -> String? {
		let addParagraphDot = {  "• " + $0 }
		
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
			
		default:
			return nil
		}
		
		return (output?.joined(separator: "\n• ")).map(addParagraphDot)
	}
}
