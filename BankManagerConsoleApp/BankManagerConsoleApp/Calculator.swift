//
//  Calculator.swift
//  BankManagerConsoleApp
//
//  Created by 권나영 on 2021/12/27.
//

import Foundation

struct Calculator {
    func calculate(from openTime: CFAbsoluteTime, to closeTime: CFAbsoluteTime) -> String? {
        let duration = closeTime - openTime
        
        let workTime = duration.toDecimal
        return workTime
    }
}

//MARK: - CFAbsoluteTime Extension

extension CFAbsoluteTime {
    fileprivate var toDecimal: String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(for: self)
    }
}
