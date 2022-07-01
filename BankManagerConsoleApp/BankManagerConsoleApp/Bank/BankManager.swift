//
//  BankManager.swift
//  Created by Kiwi, Kay.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var numberOfCustomers: Int = 0
var lineOfCustomers = BankManagerQueue<Customer>()

func generateRandomNumberOfCustomers() {
    numberOfCustomers = Int.random(in: 10...30)
}

func insertCustomersIntoQueue() {
    for element in 1...numberOfCustomers {
        let customer: Customer = Customer(customerNumber: element)
        lineOfCustomers.enqueue(data: customer)
    }
}

let handleCustomers = DispatchWorkItem {
    var totalTimeOfWork: Double = 0.0
    while !lineOfCustomers.isEmpty {
        guard let verifiedCustomer = lineOfCustomers.dequeue() else { return }
        print("\(verifiedCustomer.customerNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: Time.perPerson.rawValue)
        print("\(verifiedCustomer.customerNumber)번 고객 업무 완료")
        totalTimeOfWork += Time.perPerson.rawValue
    }
    print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomers)명이며, 총 업무시간은 \(String(format: "%.2f", totalTimeOfWork))초 입니다.")
}
