//
//  Int +.swift
//  BankManagerUIApp
//
//  Created by Erick, Serena on 2023/07/21.
//

extension Int {
    var minute: String {
        String(format: "%02d", self / 60)
    }
    
    var second: String {
        String(format: "%02d", self % 60)
    }
}
