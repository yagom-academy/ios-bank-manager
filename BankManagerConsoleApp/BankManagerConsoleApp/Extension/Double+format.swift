//
//  Double+format.swift
//  BankManagerConsoleApp
//
//  Created by 이차민 on 2021/12/23.
//

import Foundation

extension Double {
    var formatted : String {
        return String(format: "%.2f", self)
    }
}
