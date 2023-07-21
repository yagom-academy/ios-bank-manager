//
//  Int +.swift
//  BankManagerUIApp
//
//  Created by Erick, Serena on 2023/07/21.
//

extension Int {
    var minutes: String {
        String(format: "%02d", (self % 3600) / 60)
    }
    
    var seconds: String {
        String(format: "%02d", self % 60)
    }
}
