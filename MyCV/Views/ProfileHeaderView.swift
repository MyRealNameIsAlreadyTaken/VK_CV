//
//  ProfileHeaderView.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView, NibLoading {

	@IBOutlet var profileImageView: UIImageView?
	@IBOutlet var fullNameLabel: UILabel?
	@IBOutlet var phoneNumberTextView: UITextView?
	@IBOutlet var emailAddressTextView: UITextView?
	
	var model: Applicant? {
		didSet {
			self.fill(with: model)
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		self.translatesAutoresizingMaskIntoConstraints = false
		
		let imageViewWidth = self.profileImageView?.bounds.width
		imageViewWidth.map { self.profileImageView?.layer.cornerRadius = $0 / 2 }
		self.layer.cornerRadius = 12
	}
	
	private func fill(with model: Applicant?) {
		// TODO:- Add implementation
	}
}
