//
//  Double+Extension.swift
//  BankManagerConsoleApp
//
//  Created by Jae-hoon Sim on 2021/12/23.
//

import Foundation

extension Double {
    private static let numberFormatter = NumberFormatter()
    
    func roundOff(fractionDigits: Int = 2) -> String {
        Double.numberFormatter.roundingMode = .floor
        Double.numberFormatter.maximumFractionDigits = fractionDigits
        Double.numberFormatter.minimumFractionDigits = fractionDigits
        
        return Double.numberFormatter.string(for: self) ?? String.empty
    }
}
