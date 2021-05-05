//
//  Operations.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/29.
//

import Foundation

class HandleCustomerOperation: Operation {
    let customer: Customer
    
    init(customer: Customer) {
        self.customer = customer
        super.init()
    }
    
    override func main() {
        handleBanking(customer: customer)
    }
    
    private func handleBanking(customer: Customer) {
        print("\(customer.ticketNumber)번 \(customer.priority.name)고객 \(customer.task.name)업무 시작")
        usleep(customer.task.time)
        print("\(customer.ticketNumber)번 \(customer.priority.name)고객 \(customer.task.name)업무 완료")
    }
}
