//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by yeha on 2021/12/24.
//

import Foundation

struct BankClerk: Workable {
    func work() {
        let clerk: DispatchQueue = startWork(by: 1)
        
        clerk.async {
        }
    }
}
