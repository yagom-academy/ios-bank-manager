//
//  Double+extension.swift
//  BankManagerConsoleApp
//
//  Created by 레옹아범, 혜모리 on 2023/03/08.
//

import Foundation

extension Double {
    static let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        return numberFormatter
    }()
    
    func applyNumberFormatter() -> String {
        guard let value = Double.numberFormatter.string(for: Double(self)) else {
            return BankOption.zero
        }
        return value
    }
}
