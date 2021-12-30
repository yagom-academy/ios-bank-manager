//
//  Double+Extensions.swift
//  BankManagerConsoleApp
//
//  Created by Jun Bang on 2021/12/27.
//

import Foundation

extension Double {
    var secondDecimalFormat: String {
        return String(format: "%.2f", self)
    }
}
