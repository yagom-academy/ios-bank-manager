//
//  BankDepartment.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/12.
//

import Foundation

struct BankDepartment {
    private let responsibility: BankingService
    private let numberOfBankTeller: Int
    private let departmentQueue: DispatchQueue = DispatchQueue(label: "departmentQueue", attributes: .concurrent)
    private let semaphore: DispatchSemaphore
    private let group: DispatchGroup
    
    init(responsibility: BankingService, numberOfBankTeller: Int, group: DispatchGroup) {
        self.responsibility = responsibility
        self.numberOfBankTeller = numberOfBankTeller
        self.semaphore = DispatchSemaphore(value: numberOfBankTeller)
        self.group = group
    }
    
    private func work() {
        Thread.sleep(forTimeInterval: responsibility.duration)
    }
    
    func takeOnTask(for customer: Customer,
                    startHandler: @escaping (Customer) -> Void = { _ in },
                    completionHandler: @escaping (Customer) -> Void = { _ in }) {
        departmentQueue.async(group: group) {
            semaphore.wait()
            startHandler(customer)
            work()
            completionHandler(customer)
            semaphore.signal()
        }
    }
}
