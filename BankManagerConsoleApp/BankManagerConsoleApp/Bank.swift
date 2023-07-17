//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by mint, Jusbug on 2023/07/13.
//

import Foundation

class Bank: Manageable {
    var name: String
    private var tellers: [BankTask: Int]
    private var line: [BankTask: Queue<Customer>] = [.deposit: Queue<Customer>(), .loan: Queue<Customer>()]
    private let customerNumber: Int = Int.random(in: 10...30)
    private var totalTime: Double = 0.0
    private let counter = DispatchSemaphore(value: 1)
    private let group = DispatchGroup()

    init(name: String, tellers: [BankTask: Int]) {
        self.name = name
        self.tellers = tellers
    }
    
    func open() {
        giveTicketNumber(numbers: customerNumber)
        operateWindow(task: .deposit)
        operateWindow(task: .loan)
        group.wait()
        close()
    }
    
    private func giveTicketNumber(numbers: Int) {
        for number in 1...numbers {
            let customer = Customer(numberTicket: number)
            
            line[customer.bankTask]?.enqueue(customer)
        }
    }
    
    private func operateWindow(task: BankTask) {
        guard let tellerCount = tellers[task],
              let line = line[task] else {
            return
        }
        
        for _ in 1...tellerCount {
            DispatchQueue.global().async(group: group) {
                self.assignCustomerTask(line: line)
            }
        }
    }
    
    private func assignCustomerTask(line: Queue<Customer>) {
        var line = line
        
        while !line.isEmpty {
            counter.wait()
            guard let customer = line.dequeue() else {
                counter.signal()
                return
            }
            counter.signal()
            processCustomer(customer)
            totalTime += customer.bankTask.time
        }
    }
    
    private func processCustomer(_ customer: Customer) {
        print("\(customer.numberTicket)번 고객 \(customer.bankTask.type)업무 시작")
        Thread.sleep(forTimeInterval: customer.bankTask.time)
        print("\(customer.numberTicket)번 고객 \(customer.bankTask.type)업무 완료")
    }
    
    private func close() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerNumber)명이며, 총 업무시간은 \(String(format: "%.2f", totalTime))초입니다.")
    }
}

