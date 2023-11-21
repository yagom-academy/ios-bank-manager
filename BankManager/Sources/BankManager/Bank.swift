//
//  Bank.swift
//  
//
//  Created by Hisop on 2023/11/17.
//

import Foundation

public class Bank {
    private var name: String
    private var employeesCount: Int
    private var customerCount: Int = 0
    private var workTime: Double = 0
    
    private let customerQueue = CustomerQueue<Customer>()
    private let semaphore = DispatchSemaphore(value: 1)
    
    init(name: String, employeesCount: Int) {
        self.name = name
        self.employeesCount = employeesCount
    }
    
    public func open() {
        makeCustomer()
        startWork()
        endWork()
    }
    
    private func endWork() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(String(format: "%.2f", workTime))초입니다.")
        customerCount = 0
        workTime = 0
    }
    
    private func startWork() {
        let workItem = makeWork()
        let group = DispatchGroup()
        
        for _ in 1...employeesCount {
            DispatchQueue.global().async(group: group, execute: workItem)
        }
        group.wait()
    }
    
    private func makeWork() -> DispatchWorkItem {
        return DispatchWorkItem(block: { [self] in
            while customerQueue.isEmpty() == false {
                semaphore.wait()
                guard let customer = customerQueue.dequeue() else {
                    return
                }
                semaphore.signal()
                print("\(customer.number)번 고객 업무 시작")
                Thread.sleep(forTimeInterval: 0.7)
                customerCount += 1
                workTime += 0.7
                print("\(customer.number)번 고객 업무 완료")
            }
        })
    }
    
    private func makeCustomer() {
        let count = Int.random(in: 10...30)
        for number in 1...count {
            customerQueue.enqueue(value: Customer(number: number)) 
        }
    }
}

