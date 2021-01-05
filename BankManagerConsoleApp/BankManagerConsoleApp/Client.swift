//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/05.
//

import Foundation

class Client {
    let waitingNumber: Int
    let needTimeToWork: Double
    
    init(waitingNumber: Int, needTimeToWork: Double) {
        self.waitingNumber = waitingNumber
        self.needTimeToWork = needTimeToWork
    }
}
