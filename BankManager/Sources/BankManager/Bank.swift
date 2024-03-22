//
//  File.swift
//  
//
//  Created by Diana, Hamzzi on 3/20/24.
//

struct Bank {
    var bankers: [Banker] = []
    var waitingCustomers: Queue<Customer> = Queue<Customer>()
    
    // 은행원 추가
    mutating func addBanker(_ banker: Banker) {
        bankers.append(banker)
    }
    
    // 대기중인 고객 추가
    mutating func addCustomer() {
        let totalCustomers = Int.random(in: 10...30)
        
        for number in 1...totalCustomers {
            let customer = Customer(number: number)
            waitingCustomers.enqueue(customer)
        }
    }
    
    // 은행 업무 처리 -> 비동기적 작업의 체인 유지
    mutating func processWorkforOneBanker(_ banker: Banker) async throws {
        repeat {
            guard let customer = waitingCustomers.dequeue() else {
                return
            }
            try await banker.processCustomer(customer)
        } while waitingCustomers.isEmpty
    }
}
