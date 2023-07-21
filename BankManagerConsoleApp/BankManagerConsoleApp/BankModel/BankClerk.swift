//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by yyss99, 비모 on 2023/07/13.
//

import Foundation

struct BankClerk {
    private let serviceType: ServiceType
    private let semaphore: DispatchSemaphore
    
    init(serviceType: ServiceType, numberOfBankClerk: Int) {
        self.serviceType = serviceType
        self.semaphore = DispatchSemaphore(value: numberOfBankClerk)
    }
    
    func work(for customer: Customer, in group: DispatchGroup) {
        DispatchQueue.global().async(group: group) {
            semaphore.wait()
            
            print("\(customer.number)번 고객 \(serviceType.description)업무 시작")
            Thread.sleep(forTimeInterval: serviceType.workTime)
            print("\(customer.number)번 고객 \(serviceType.description)업무 종료")
            
            semaphore.signal()
        }
    }
}
