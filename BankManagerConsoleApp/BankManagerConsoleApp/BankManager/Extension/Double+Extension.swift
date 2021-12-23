//
//  Double+Extension.swift
//  BankManagerConsoleApp
//
//  Created by Jae-hoon Sim on 2021/12/23.
//

import Foundation

extension Double {
    var roundedOff: String {
        String(format: "%.2f", self)
    }
}
