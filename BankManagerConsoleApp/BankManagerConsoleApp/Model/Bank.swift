//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

final class Bank {
    private var bankers: [Banker] = []
    private var customerQueue: CustomerQueue<Customer> = CustomerQueue()
    
    func open() -> Int {
        setBankers()
        receiveCustomer()
        let totalCustomer = customerQueue.count
        
        orderWork()
        
        return totalCustomer
    }

    private func setBankers() {
        let yagom = Banker(name: "야곰")
        bankers.append(yagom)
    }
    
    private func receiveCustomer() {
        guard let totalCustomer = (10...30).randomElement() else { return }
        
        for number in 1...totalCustomer {
            let customer = Customer(numberTicket: number.description)
            customerQueue.enqueue(customer)
        }
    }
    
    private func orderWork() {
        let totalCustomer = customerQueue.count
        
        for _ in 1...totalCustomer {
            bankers.forEach { banker in
                let customer = customerQueue.dequeue()
                banker.doWork(for: customer)
            }
        }
    }
}
