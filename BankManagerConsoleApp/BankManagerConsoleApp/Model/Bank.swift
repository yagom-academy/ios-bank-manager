//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

import Foundation

/*
 1. 은행원의 수 구현 - 3명으로 제한
 2. 업무 종류와 소요 시간 구현
 
 구현 방법
 - Semephore + DispatchQueue
 - OperationQueue
 
 */


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
        while !isQueueEmpty {
            guard let customer = customerQueue?.dequeue() else { return }
            
            // 대기열에서 손님이 차례가 되어서 일어났다.
            
            // 손님은 해당되는 업무가 있기에 해당되는 직원을 찾아가야 한다.
                // 손님의 업무가 예금이라면 예금 은행원이 있는 곳
                // 손님의 업무가 대출이라면 대출 은행원이 있는 곳
            
            // 은행원은 이에 맞춰서 업무를 볼 수 있어야 한다.
                // 즉, 대출업무와 예금 업무를 모두 볼 수 있어야 한다.
            
            // 은행 업무는 해당되는 시간만큼 걸리기 때문에 시간이 지난 후, 업무를 종료한다.
            
            // 은행원은 업무가 끝나는 즉시 다른 업무를 할 수 있어야 한다.
        }
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
