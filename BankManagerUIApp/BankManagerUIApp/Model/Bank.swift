//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Siwon Kim on 2021/12/23.
//

import Foundation



class Bank {
    private let customerQueue: Queue<Customer> = Queue<Customer>()
    private var bankClerk: BankClerk
    private let randomCount = Int.random(in: 10...30)

    init(bankClerk: BankClerk) {
        self.bankClerk = bankClerk
        setupCustomerQueue(with: randomCount)
    }
    
    func setupCustomerQueue(with amount: Int) {
        (1...amount).forEach { _ in
            guard let lastCustomer = customerQueue.returnAllElements().last else {
                customerQueue.enqueue(value: Customer(turn: 1))
                return
            }
            customerQueue.enqueue(value: Customer(turn: lastCustomer.turn + 1))
        }
    }
    
    func resetCustomerQueue() {
        customerQueue.clear()
    }
    
    func returnAllCustomers() -> [Customer] {
        return customerQueue.returnAllElements()
    }
    
    func open(timer: BankTimer) {
        DispatchQueue.main.async {
            timer.start()
        }
        
        let group = DispatchGroup()
        let semaphore = DispatchSemaphore(value: 2)
        let depositQueue = DispatchQueue(label: "deposit", attributes: .concurrent)
        let loanQueue = DispatchQueue(label: "loan")
        let bankGroup = DispatchGroup()

        while let customer = customerQueue.dequeue() {
            switch customer.task {
            case .deposit:
                depositQueue.async(group: group) {
                    semaphore.wait()
                    self.bankClerk.work(with: customer)
                    semaphore.signal()
                }
            case .loan:
                loanQueue.async(group: group) {
                    self.bankClerk.work(with: customer)
                }
            }
        }
        
        group.notify(queue: DispatchQueue.main) {
            timer.stop()
        }
    }
}
