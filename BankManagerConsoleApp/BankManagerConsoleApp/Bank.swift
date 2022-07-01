//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/01.
//

struct Bank: Agency {
    typealias T = BankCustomer
    var customerQueue: Queue<BankCustomer>
    var banker = Banker()
    
    mutating func generateEmployee(numberOfBankers: Int) {
        
    }
    
    mutating func openAgency() {
        for _ in customerQueue {
            guard let currentCustomer = customerQueue.dequeue() else { return }
            banker.startWork(of: currentCustomer)
            banker.finishWork(of: currentCustomer)
        }
    }
    
    mutating func closeAgency() {
        
    }
    

}
