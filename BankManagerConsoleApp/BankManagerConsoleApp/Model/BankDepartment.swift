//
//  BankDepartment.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/12.
//

import Foundation

struct BankDepartment {
    private let departmentQueue: DispatchQueue = DispatchQueue(label: "departmentQueue", attributes: .concurrent)
    private let semaphore: DispatchSemaphore
    private let group: DispatchGroup
    
    init(numberOfBankTeller: Int, group: DispatchGroup) {
        self.semaphore = DispatchSemaphore(value: numberOfBankTeller)
        self.group = group
    }
    
    private func work(for customer: Customer) {
        Thread.sleep(forTimeInterval: customer.service.duration)
    }
    
    func takeOnTask(for customer: Customer,
                    startHandler: @escaping (Customer) -> Void = { _ in },
                    completionHandler: @escaping (Customer) -> Void = { _ in }) {
        departmentQueue.async(group: group) {
            semaphore.wait()
            startHandler(customer)
            work(for: customer)
            completionHandler(customer)
            semaphore.signal()
        }
    }
}
