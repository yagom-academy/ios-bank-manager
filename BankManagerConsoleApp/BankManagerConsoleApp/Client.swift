//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/05.
//

import Foundation

final class Client {
    let waitingNumber: Int
    let businessType: BusinessType
    
    init(waitingNumber: Int, businessType: BusinessType = .normal) {
        self.waitingNumber = waitingNumber
        self.businessType = businessType
    }
}
