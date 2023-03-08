//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

final class Bank {
    private var customerQueue: CustomerQueue<Customer> = CustomerQueue()
    private var bankers: [Banker] = []
    private let numberOfBanker: Int
    private(set) var totalCustomer: Int = 0
    
    init(numberOfBanker: Int = 1) {
        self.numberOfBanker = numberOfBanker
    }
    
    func open() {
        setBankers()
        receiveCustomer()
        orderWork()
    }
    
    private func setBankers() {
        for _ in 1...numberOfBanker {
            let banker = Banker()
            bankers.append(banker)
        }
    }
    
    private func receiveCustomer() {
        let customerRange: ClosedRange<Int> = 10...30
        totalCustomer = Int.random(in: customerRange)
        
        for number in 1...totalCustomer {
            let customer = Customer(numberTicket: number.description)
            customerQueue.enqueue(customer)
        }
    }
    
    private func orderWork() {
        while customerQueue.isEmpty == false {
            bankers.forEach { banker in
                let customer = customerQueue.dequeue()
                banker.doWork(for: customer)
            }
        }
    }
    
    func reportResult() {
        let totalProcessTime = Double(totalCustomer) * Banker.processTime
        let message = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(totalProcessTime)초 입니다."
        print(message)
    }
}
