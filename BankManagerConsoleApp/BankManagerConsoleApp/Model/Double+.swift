//
//  String+.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/27.
//

import Darwin

extension Double {
    var formatSecondDecimal: String {
        return String(format: "%.2f", floor(self * 10) / 10 )
    }
}
