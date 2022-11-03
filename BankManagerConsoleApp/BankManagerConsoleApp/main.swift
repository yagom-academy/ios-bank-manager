//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bankManager = BankManager()

while bankManager.isRunning {
    do {
        try bankManager.run()
    } catch {
        if let error = error as? BankError {
            print(error.message)
        }
    }
}
