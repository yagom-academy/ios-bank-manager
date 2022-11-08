//
//  CFAbsoluteTime+.swift
//  BankManagerConsoleApp
//
//  Created by Aaron, ttotale on 2022/11/03.
//

import Foundation

extension CFAbsoluteTime {
    var formattedNumber: String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.roundingMode = .floor
        numberFormatter.maximumSignificantDigits = 4
        
        return numberFormatter.string(for: self) ?? ""
    }
}
