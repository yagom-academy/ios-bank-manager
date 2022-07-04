//
//  NumberFormatter.swift
//  BankManagerConsoleApp
//
//  Created by unchain, BaekGom on 2022/06/30.
//

import Foundation

extension Double {
    func numberFormatter() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = SetNumber.decimalRange.rawValue
        numberFormatter.minimumFractionDigits = SetNumber.decimalRange.rawValue
        
        let result = numberFormatter.string(for: self) ?? "\(SetNumber.failNumberFormatter.rawValue)"
        
        return result
    }
}
