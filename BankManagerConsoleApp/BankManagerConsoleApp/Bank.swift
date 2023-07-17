//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by mint, Jusbug on 2023/07/13.
//

import Foundation

class Bank: Manageable {
    var name: String
    var teller: (deposit: Int, loan: Int)
    private let customerNumber: Int = Int.random(in: 10...30)
    private var depositLine = Queue<Customer>()
    private var loanLine = Queue<Customer>()
    private var totalTime: Double = 0.0
    
    init(name: String, teller: (deposit: Int, loan: Int), depositLine: Queue<Customer> = Queue<Customer>(), loanLine: Queue<Customer> = Queue<Customer>(), totalTime: Double = 0) {
        self.name = name
        self.teller = teller
        self.depositLine = depositLine
        self.loanLine = loanLine
        self.totalTime = totalTime
    }
    
    func start() {
        let group = DispatchGroup()
        
        giveTicketNumber(numbers: customerNumber)
        operateWindow(tellerCount: teller.deposit, line: depositLine, group: group)
        operateWindow(tellerCount: teller.loan, line: loanLine, group: group)
        closeBank()
    }
    
    private func giveTicketNumber(numbers: Int) {
        for number in 1...numbers {
            let customer = Customer(numberTicket: number, bankTask: BankTask.allCases.randomElement() ?? .deposit)
            
            switch customer.bankTask {
            case .deposit:
                depositLine.enqueue(customer)
            case .loan:
                loanLine.enqueue(customer)
            }
        }
    }
    
    private func operateWindow(tellerCount: Int, line: Queue<Customer>, group: DispatchGroup) {
        for _ in 1...tellerCount {
            DispatchQueue.global().async(group: group) {
                self.assignCustomerTask(line: line)
            }
        }
    }
    
    private func assignCustomerTask(line: Queue<Customer>) {
        var line = line
        
        while !line.isEmpty {
            guard let customer = line.dequeue() else {
                return
            }
            processCustomer(customer)
            totalTime += customer.bankTask.time
        }
    }
    
    private func closeBank() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerNumber)명이며, 총 업무시간은 \(String(format: "%.2f", totalTime))초입니다.")
       }
    
    private func processCustomer(_ customer: Customer) {
        print("\(customer.numberTicket)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(customer.numberTicket)번 고객 업무 완료")
    }
}

