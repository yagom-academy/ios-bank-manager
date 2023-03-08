//
//  Double+Extension.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/08.
//

import Foundation

extension Double {
    func numberFormat() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        
        return numberFormatter.string(for: self)
    }
}
