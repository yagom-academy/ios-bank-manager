//
//  StringExtension.swift
//  BankManagerConsoleApp
//
//  Created by Yeon on 2021/01/04.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Double) {
        let roundedNumber = round(value * 1000) / 1000
        
        appendLiteral(String(format: "%.2f", roundedNumber))
    }
}
