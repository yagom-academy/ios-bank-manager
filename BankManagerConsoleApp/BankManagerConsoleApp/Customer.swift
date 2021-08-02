//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/07/30.
//

import Foundation

struct Customer {
    var number = 0
    
    mutating func makeRandomNumber() {
        self.number = Int.random(in: Int.ten..<Int.thirty)
    }

}
