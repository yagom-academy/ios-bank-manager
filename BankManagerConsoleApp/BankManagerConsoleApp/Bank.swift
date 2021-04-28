//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Ryan-Son on 2021/04/27.
//

struct Bank {
    var teller: Teller
    var totalCustomer: Int = 0
    var waitingQueue = WaitingQueue()
    
    init(teller: Teller) {
        self.teller = teller
        self.totalCustomer = Int.random(in: 10...30)
    }
    
    mutating func open() {
        // 텔러 업무 처리
        let nextCustomer: Result = waitingQueue.dequeue()
        
        visitNewCustomer()
        
        switch nextCustomer {
        case .success(let customer):
            teller.processTask(for: customer.waitingNumber)
        case .failure(let error):
            print(error)
        }
        
        close()
    }
    
    private func close() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer) 명이며, 총 업무 시간은 \(totalProcessedTime())초입니다.")
    }
    
    mutating private func visitNewCustomer() {
        for waitingNumber in 1...totalCustomer {
            let customer = Customer(waitingNumber: waitingNumber)
            waitingQueue.enqueue(customer)
        }
    }
    
    private func checkIfNoCustomer() {
        if waitingQueue.queue.isEmpty {
            self.close()
        }
    }
    
    func totalProcessedTime() -> Double {
        let processingTimePerTask: Double = 0.7
        return processingTimePerTask * Double(totalCustomer)
    }
}
