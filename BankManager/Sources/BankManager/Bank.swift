//
//  File.swift
//  
//
//  Created by Diana, Hamzzi on 3/20/24.
//

struct Bank {
    var bankers: [Banker]
    var waitingCustomers: Queue<Customer>
    
    // 은행원 추가
    mutating func addBanker(_ banker: Banker) {
        bankers.append(banker)
    }
    
    // 대기중인 고객 추가
    mutating func addCustomer() {
        let number = Int.random(in: 10...30)
        let customer = Customer(number: number)
        waitingCustomers.enqueue(customer)
    }
    
    // 은행 업무 처리
    mutating func processWorkforOneBanker(_ banker: Banker) {
        repeat {
            guard let customer = waitingCustomers.dequeue() else {
                return
            }
            
            banker.processCustomer(customer)
        } while waitingCustomers.isEmpty
    }
}
