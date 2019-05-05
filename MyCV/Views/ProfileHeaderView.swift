//
//  ProfileHeaderView.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView, NibLoading {

	@IBOutlet var containerView: UIView?
	@IBOutlet var profileImageView: UIImageView?
	@IBOutlet var activityIndicator: UIActivityIndicatorView?
	@IBOutlet var fullNameLabel: UILabel?
	@IBOutlet var phoneNumberTextView: UITextView?
	@IBOutlet var emailAddressTextView: UITextView?
	
	var model: Applicant? {
		didSet {
			self.fill(with: model)
			DispatchQueue.main.async {
				self.activityIndicator?.stopAnimating()
			}
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		self.translatesAutoresizingMaskIntoConstraints = false
		
		let imageViewWidth = self.profileImageView?.bounds.width
		imageViewWidth.map { self.profileImageView?.layer.cornerRadius = $0 / 2 }
		
		self.containerView?.layer.cornerRadius = 12
		self.profileImageView?.layer.borderWidth = 1.5
		self.profileImageView?.layer.borderColor = UIColor.black.cgColor
		
		let headerFont = UIFont(name: "GillSans", size: 20)
		let headerFontMetrics = UIFontMetrics(forTextStyle: .title2)
		
		headerFont.map { self.fullNameLabel?.font = headerFontMetrics.scaledFont(for: $0) }
	}
	
	private func fill(with model: Applicant?) {
		model?.loadProfileImage { image in
			DispatchQueue.main.async {
				self.profileImageView?.image = image
			}
		}
		
		DispatchQueue.main.async {
			self.fullNameLabel?.text = model?.fullName
			self.phoneNumberTextView?.text = model?.phoneNumber
			self.emailAddressTextView?.text = model?.emailAddress
		}
	}
}
