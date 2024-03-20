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
    mutating func addCustomer(_ customer: Customer) {
        waitingCustomers.enqueue(customer)
    }
    
    // 은행 업무 처리
}
