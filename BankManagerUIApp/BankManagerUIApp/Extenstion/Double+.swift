//
//  Double+.swift
//  BankManagerUIApp
//
//  Created by Erick, Serena on 2023/07/21.
//

extension Double {
    var minute: String {
        String(format: "%02d", Int(self) / 60)
    }
    
    var second: String {
        String(format: "%02d", Int(self) % 60)
    }
    
    var millisecond: String {
        let integerNumber = Int(self)
        return String(format: "%03d", Int((self - Double(integerNumber)) * 1000))
    }
}
