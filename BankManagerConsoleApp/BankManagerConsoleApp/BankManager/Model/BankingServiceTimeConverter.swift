//
//  BankingServiceTimeConverter.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/19.
//

import Foundation

func bankingServiceTimeConverter(_ bankingServiceTime: Double) throws -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.maximumFractionDigits = 2
    numberFormatter.roundingMode = .halfUp
    
    guard let numberFormatted = numberFormatter.string(for: bankingServiceTime) else {
        print(NumberFormatError.convertedString.localized)
        throw NumberFormatError.convertedString
    }
    
    return numberFormatted
}
