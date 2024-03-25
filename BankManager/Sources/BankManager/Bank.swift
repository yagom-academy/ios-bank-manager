//
//  File.swift
//  
//
//  Created by Diana, Hamzzi on 3/20/24.
//

class Bank {
    var waitingCustomers: Queue<Customer> = Queue<Customer>()
    let timer = DispatchSource.makeTimerSource()
    timer.setEventHandler {
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
        
        timer.schedule(deadline: .now() + 0.7, repeating: .never)
        timer.activate()
        
        print("\(customer.name) 업무 완료")
    }
}
