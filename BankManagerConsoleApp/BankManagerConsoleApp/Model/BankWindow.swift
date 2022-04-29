//
//  BankWindow.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

protocol BankWindow { }

extension BankWindow {
    func work(for customer: Customer) {
        print("\(customer.waitingNumber)번 고객 업무 시작")
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: 0.7)
        }
        print("\(customer.waitingNumber)번 고객 업무 완료")
    }
}

struct BankCommonWindow: BankWindow { }
