//
//  Int+Extension.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/08.
//

import Foundation

extension Int {
    func numberFormat() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        
        return numberFormatter.string(for: self)
    }
}
