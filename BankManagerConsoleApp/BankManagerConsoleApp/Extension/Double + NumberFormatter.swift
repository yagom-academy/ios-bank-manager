//
//  Double + NumberFormatter.swift
//  BankManagerConsoleApp
//
//  Created by 양호준 on 2021/12/24.
//

import Foundation

extension Double {
    var formatted: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumFractionDigits = 2
        
        return numberFormatter.string(for: self) ?? "0"
    }
}
