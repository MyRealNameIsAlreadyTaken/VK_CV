//
//  UIViewExt.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

extension UIView {
	
	func constraint(leading: Bool = true, top: Bool = true, trailing: Bool = true, bottom: Bool = true,
					to view: UIView,
					constant: CGFloat = 0.0) {
		self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = leading
		self.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: constant).isActive = top
		self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = trailing
		self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = bottom
	}
}
