//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

import Foundation

struct Bank {
    enum Constant {
        static let depositTakenSeconds: Double = 0.7
    }

    private var customerQueue: CustomerQueue<Customer>?
    private var isQueueEmpty: Bool {
        return customerQueue?.isEmpty ?? true
    }

    init(customerQueue: CustomerQueue<Customer>? = nil) {
        self.customerQueue = customerQueue
    }

    mutating func createQueue() {
        customerQueue = CustomerQueue()
    }

    mutating func addCustomer(customer: Customer) {
        customerQueue?.enqueue(value: customer)
    }

    mutating func startWork() {
        var time: Double = 0
        var customerCount: Int = 0

        while !isQueueEmpty {
            guard let customer = customerQueue?.dequeue() else {
                return
            }

            print("\(customer.ticketNumber)번 고객 업무 시작")

            DispatchQueue.global().sync {
                Thread.sleep(forTimeInterval: Constant.depositTakenSeconds)
                time += (Constant.depositTakenSeconds)
                customerCount += 1
                print("\(customer.ticketNumber)번 고객 업무 종료")
            }
        }

        endWork(customerCount: customerCount, duringTime: time)
    }

    private func endWork(customerCount: Int, duringTime: Double) {
        print("업무를 마감합니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(duringTime.convertedNumberToTime)초입니다.")
    }

    mutating func resetCustomerQueue() {
        customerQueue?.clear()
        customerQueue = nil
    }
}

private extension Double {
    static let hundred: Self = 100.0
    var convertedNumberToTime: String {
        return String(format: "%.2f", (self * Self.hundred).rounded() / Self.hundred)
    }
}
