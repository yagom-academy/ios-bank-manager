//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/01.
//

struct Bank: Agency {
    var banker = Banker()
    var customerCount: Int?
    var ticketNumberQueue: Queue<BankCustomer> = {
        let randomNumber = Int.random(in: NameSpace.randomCustomerNumberRange)
        var randomCustomerQueue = Queue<BankCustomer>()
        
        for index in 1...randomNumber {
            randomCustomerQueue.enqueue(data: BankCustomer(id: index))
        }
        
        return randomCustomerQueue
    }()
    
    mutating func open() {
        customerCount = ticketNumberQueue.count
        for _ in ticketNumberQueue {
            guard let currentCustomer = ticketNumberQueue.dequeue() else { return }
            banker.startWork(of: currentCustomer)
            banker.finishWork(of: currentCustomer)
        }
    }
    
    mutating func close() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount ?? 0)명이며, 총 업무시간은 \(banker.totalWorkTime.formatDoubleToString())초입니다.")
    }
}
