//
//  WorkLoadManager.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/11/02.
//

import Foundation

extension Double {

    var formatted: String? {
        let number = NSNumber(integerLiteral: Int(self))
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2
        guard let result = numberFormatter.string(from: number) else {
            return nil
        }
        
        return result
    }
}
