//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by  Donnie, Safari on 2022/04/27.
//

import Foundation

struct BankClerk {
    func processTask(for customer: String) {
        print(customer + " 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print(customer + " 업무 완료")
    }

}
