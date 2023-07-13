//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by mint, Jusbug on 2023/07/13.
//

import Foundation

struct Bank: Manageable {
    var name: String
    var tellers: [Teller]
    let customerNumber: Int = Int.random(in: 10...30)
    var waitingLine = Queue<Customer>()
    var totalTime: Double = 0.0
    
    mutating func start() {
        giveTicketNumber(numbers: customerNumber)
        assignCustomer()
        closeBank()
    }
    
    mutating func giveTicketNumber(numbers: Int) {
        for number in 1...numbers {
            let customer = Customer(numberTicket: number)
            
            waitingLine.enqueue(customer)
        }
    }
    
    mutating func assignCustomer() {
        while !waitingLine.isEmpty {
            for teller in tellers {
                guard let customer = waitingLine.dequeue() else {
                    return
                }
                
                teller.processCustomer(customer)
                totalTime += 0.7
            }
        }
    }
    
    func closeBank() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerNumber)명이며, 총 업무시간은 \(String(format: "%.2f", totalTime))초입니다.")
       }
}
