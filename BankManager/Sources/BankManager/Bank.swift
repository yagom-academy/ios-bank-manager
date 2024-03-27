//
//  File.swift
//  
//
//  Created by Diana, Hamzzi on 3/20/24.
//

final class Bank {
    var waitingCustomers: Queue<Customer> = Queue<Customer>()
    
    func hasWaitingCustomers() -> Bool {
        return !waitingCustomers.isEmpty
    }
    
    func addCustomer(with range: ClosedRange<Int>) {
        let totalCustomers = Int.random(in: range)
        
        for number in 1...totalCustomers {
            let customer = Customer(number: number)
            waitingCustomers.enqueue(customer)
        }
    }
    
    func processBankWork() async throws -> Bool {
        guard !waitingCustomers.isEmpty else { return false }
        guard let customer = waitingCustomers.dequeue() else { return false }
        
        try await processCustomer(customer)
        
        return true
    }
    
    func processCustomer(_ customer: Customer) async throws {
        print("\(customer.waitingNumber) 업무 시작")
        
        if #available(iOS 13.0, *), #available(macOS 10.15, *) {
            try await Task.sleep(nanoseconds: 700_000_000)
        }
        
        print("\(customer.waitingNumber) 업무 완료")
    }
}
