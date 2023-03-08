//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

final class Bank {
    private var customerQueue: CustomerQueue<Customer> = CustomerQueue()
    private let bankers: [Banker]
    private(set) var totalCustomer: Int = 0
    
    init(numberOfBanker number: Int = 1) {
        self.bankers = Bank.registerBankers(numberOfBanker: number)
    }
    
    func open() {
        receiveCustomer()
        orderWork()
    }
    
    private static func registerBankers(numberOfBanker: Int) -> [Banker] {
        let bankers = [1...numberOfBanker].map { _ in
            let banker = Banker()
            return banker
        }
        
        return bankers
    }
    
    private func receiveCustomer() {
        let customerRange: ClosedRange<Int> = 10...30
        totalCustomer = Int.random(in: customerRange)
        
        for number in 1...totalCustomer {
            let numberTicket = String(describing: number)
            let customer = Customer(numberTicket: numberTicket)
            customerQueue.enqueue(customer)
        }
    }
    
    private func orderWork() {
        while let customer = customerQueue.dequeue() {
            bankers.forEach { banker in
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
