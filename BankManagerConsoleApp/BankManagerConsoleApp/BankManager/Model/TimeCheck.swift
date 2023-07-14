//
//  TimeCheck.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/14.
//

import Foundation

public func timeCheck(_ block: () -> Void) -> String {
	let numberFormatter = NumberFormatter()
	numberFormatter.maximumFractionDigits = 2
	numberFormatter.roundingMode = .halfUp
	
	let start = Date()
	
	block()
	
	guard let numberFormatted = numberFormatter.string(for: Date().timeIntervalSince(start))
	else {
		return NumberFormattedReturn.empty
	}
	
	return numberFormatted
}

enum NumberFormattedReturn {
	static let empty = "Empty"
}
