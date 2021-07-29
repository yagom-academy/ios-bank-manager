//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by tae hoon park on 2021/07/29.
//

import Foundation

protocol Workable {
    var workTime: Double { get }
    func businessProcessing(for client: BankClient)
}

class Bank {
    
}
