//
//  ProfileVC.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

final class ProfileVC: UIViewController {

	private let profileHeaderView = ProfileHeaderView.fromNib()
	private let cvTableView = CVTableView.fromNib()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configureSubviews()
	}
	
	private func configureSubviews() {
		
		[self.profileHeaderView, self.cvTableView].forEach {
			$0 >>= self.view.addSubview
		}
		
		self.profileHeaderView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 25).isActive = true
		self.profileHeaderView?.constraint(top: false, bottom: false, to: self.view, constant: 8)
		
		guard let bottomAnchor = self.profileHeaderView?.bottomAnchor else { return }
		self.cvTableView?.topAnchor.constraint(equalTo: bottomAnchor).isActive = true
		self.cvTableView?.constraint(top: false, to: self.view, constant: 16)
	}
}

