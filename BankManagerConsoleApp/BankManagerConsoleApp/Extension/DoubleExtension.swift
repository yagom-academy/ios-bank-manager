//
//  DoubleExtension.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/05.
//

import Foundation

extension Double {
    var percisionNumber: Double {
        let digit = 1000.0
        var percisionedNumber = self * digit
        percisionedNumber.round()
        percisionedNumber /= digit
        return percisionedNumber
    }
}
