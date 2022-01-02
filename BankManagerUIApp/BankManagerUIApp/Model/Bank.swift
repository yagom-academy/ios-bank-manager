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
    
    private let bankGroup = DispatchGroup()
    private let semaphore = DispatchSemaphore(value: 2)
    private let depositQueue = DispatchQueue(label: "deposit", attributes: .concurrent)
    private let loanQueue = DispatchQueue(label: "loan")

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
        timer.start()

        while let customer = customerQueue.dequeue() {
            switch customer.task {
            case .deposit:
                depositQueue.async(group: bankGroup) {
                    self.semaphore.wait()
                    self.bankClerk.work(with: customer)
                    self.semaphore.signal()
                }
            case .loan:
                loanQueue.async(group: bankGroup) {
                    self.bankClerk.work(with: customer)
                }
            }
        }
        
        bankGroup.notify(queue: DispatchQueue.main) {
            timer.stop()
        }
    }
}
