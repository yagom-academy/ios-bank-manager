//
//  TotalCustomer.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/07/01.
//

import Foundation

enum TotalCustomer {
    static func generateCustomerNumber() -> Int {
        return Int.random(in: 10...30)
    }
}
