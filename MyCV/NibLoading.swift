//
//  NibLoading.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import UIKit

protocol NibLoading {
	
	static func fromNib() -> Self?
}

extension NibLoading {
	
	static func fromNib() -> Self? {
		guard let view = UINib(nibName: String(describing: self), bundle: nil)
			.instantiate(withOwner: nil)
			.first as? Self else {
				assertionFailure("Nib not found")
				return nil
		}
		
		return view
	}
}
