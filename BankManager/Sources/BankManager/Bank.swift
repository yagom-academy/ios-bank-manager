//
//  File.swift
//  
//
//  Created by Diana, Hamzzi on 3/20/24.
//

class Bank {
    var waitingCustomers: Queue<Customer> = Queue<Customer>()
    
    func hasWaitingCustomers() -> Bool {
        return !waitingCustomers.isEmpty
    }
    
    func addCustomer() {
        let totalCustomers = Int.random(in: 10...30)
        
        for number in 1...totalCustomers {
            let customer = Customer(number: number)
            waitingCustomers.enqueue(customer)
        }
    }
    
    func processBankWork() async throws -> Bool {
        if waitingCustomers.isEmpty {
            return false
        }
        
        guard let customer = waitingCustomers.dequeue() else {
            return false
        }
        
        try await processCustomer(customer)
        
        return true
    }
    
    func processCustomer(_ customer: Customer) async throws {
        print("\(customer.name) 업무 시작")
        
        if #available(iOS 13.0, *), #available(macOS 10.15, *) {
            try await Task.sleep(nanoseconds: 700_000_000)
        }
        
        print("\(customer.name) 업무 완료")
    }
}
