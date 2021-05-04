//
//  HeadOffice.swift
//  BankManagerConsoleApp
//
//  Created by 최정민 on 2021/05/04.
//

import Foundation

class HeadOffice {
    let lock = NSLock()
    @objc func checkLoanRequest(notification: Notification) {
        lock.lock()
        
        lock.unlock()
    }
}
