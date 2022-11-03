//
//  Double+.swift
//  BankManagerConsoleApp

import Foundation

extension Double {
    func format() -> String {
        let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            
            return formatter
        }()
        
        guard let result = formatter.string(for: self) else {
            return "계산 불가능"
        }
        return result
    }
}
