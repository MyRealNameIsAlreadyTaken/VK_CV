//
//  PrecedenceGourps.swift
//  MyCV
//
//  Created by Me on 5/4/19.
//  Copyright © 2019 VitaliiKravets. All rights reserved.
//

import Foundation

precedencegroup LeftBindPrecedence {
	associativity: left
	higherThan: AssignmentPrecedence
}

precedencegroup LeftFunctionApplicationPrecedence {
	associativity: left
	higherThan: AssignmentPrecedence
}

precedencegroup RightFunctionApplicationPrecedence {
	associativity: right
	higherThan: LeftFunctionApplicationPrecedence
}
