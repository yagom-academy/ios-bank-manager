//
//  NumberFormatter.swift
//  BankManagerConsoleApp
//
//  Created by unchain, BaekGom on 2022/06/30.
//

import Foundation

func numberFormatter(number: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.maximumFractionDigits = SetNumber.decimalRange.rawValue
    numberFormatter.minimumFractionDigits = SetNumber.decimalRange.rawValue
    
    let result = numberFormatter.string(for: number) ?? "\(SetNumber.failNumberFormatter.rawValue)"
    
    return result
}
