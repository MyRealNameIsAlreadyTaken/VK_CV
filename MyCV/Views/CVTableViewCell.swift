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
	
	var model: Applicant? {
		didSet {
			self.fill(with: model)
		}
	}
	
	private func fill(with model: Applicant?) {
		// TODO:- Add implementation
	}
}
