//
//  Double+.swift
//  BankManagerConsoleApp

import Foundation

extension Double {
    func format() throws -> String {
        let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            
            return formatter
        }()
        
        guard let result = formatter.string(for: self) else {
            throw BankError.formattingError
        }
        return result
    }
}
