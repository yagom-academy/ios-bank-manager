//
//  DoubleExtension.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/05.
//

import Foundation

extension Double {
    func setPrecision() -> Double {
        let digit = 1e2
        var presisionedNumber = self * digit
        presisionedNumber.round()
        presisionedNumber /= digit
        return presisionedNumber
    }
}
