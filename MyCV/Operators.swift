//
//  Operators.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

infix operator >>=: LeftBindPrecedence
func >>= <T, U>(value: T?, f: (T) -> U?) -> U? {
	return value.flatMap(f)
}
