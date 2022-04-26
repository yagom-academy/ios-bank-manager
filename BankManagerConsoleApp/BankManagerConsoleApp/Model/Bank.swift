//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

struct Bank {
    private let waitingQueue = Queue<Customer>()
    private let clerk = BankClerk()
    private var handledCustomerCount = 0
    private var startTime = 0.0
    private var endTime = 0.0

    private var businessHours: String {
        let difference = endTime - startTime
        let flooredDifference = floor(difference * 10) / 10
        return String(format: "%.2f", flooredDifference)
    }

    mutating func open() {
        makeCustomers()
        sendCustomerToClerk()
        printBankResult()
    }

    private func makeCustomers() {
        let customerCount = Int.random(in: 10...30)
        for number in 1...customerCount {
            waitingQueue.enqueue(Customer(waitingNumber: number))
        }
    }

    private mutating func sendCustomerToClerk() {
        startTime = CFAbsoluteTimeGetCurrent()

        while !waitingQueue.isEmpty {
            guard let customer = waitingQueue.dequeue() else { return }
            handledCustomerCount += 1
            clerk.work(for: customer)
        }

        endTime = CFAbsoluteTimeGetCurrent()
    }

    private mutating func printBankResult() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(handledCustomerCount)명이며, 총 업무 시간은 \(businessHours)초입니다.")
        handledCustomerCount = 0
    }
}
