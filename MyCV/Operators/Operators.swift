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

infix operator |>: LeftFunctionApplicationPrecedence
func |> <T, U>(value: T, f: (T) -> U) -> U {
	return f § value
}

infix operator §: RightFunctionApplicationPrecedence
func § <T, U>(f: (T) -> U, value: T) -> U {
	return f(value)
}

infix operator <*>: LeftFunctionApplicationPrecedence
func <*> <T, U>(f: ((T) -> U)?, value: T?) -> U? {
	return f.flatMap { f in value.map { f($0) } }
}

infix operator <§>: LeftFunctionApplicationPrecedence
func <§> <T, U>(f: (T) -> U, value: T?) -> U? {
	return value.map(f)
}
