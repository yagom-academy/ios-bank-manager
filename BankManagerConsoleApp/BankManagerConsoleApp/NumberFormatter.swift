//
//  NumberFormatter.swift
//  BankManagerConsoleApp
//
//  Created by unchain, BaekGom on 2022/06/30.
//

import Foundation

func numberFormatter(number: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.maximumFractionDigits = 2
    numberFormatter.minimumFractionDigits = 2
    
    let result = numberFormatter.string(for: number) ?? "0"
    
    return result
}
