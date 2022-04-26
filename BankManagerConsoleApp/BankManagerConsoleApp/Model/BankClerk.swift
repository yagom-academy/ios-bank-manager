//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

struct BankClerk {
    func work(for customer: Customer) {
        print("\(customer.waitingNumber)번 고객 업무 시작")
        print("\(customer.waitingNumber)번 고객 업무 완료")
    }
}
