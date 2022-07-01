//
//  Double+extension.swift
//  BankManagerConsoleApp
//
//  Created by 김동용 on 2022/07/01.
//

import Foundation

extension Double {
    func formatDoubleToString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        
        guard let stringedNumberFormatter = numberFormatter.string(for: self) else { return "" }
        
        return stringedNumberFormatter
    }
}
