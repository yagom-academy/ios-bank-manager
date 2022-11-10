//
//  Workable.swift
//  BankManagerConsoleApp
//
//  Created by jin on 11/10/22.
//

import Foundation

protocol Workable {
    var service: Service { get }
    var processingTime: Double { get }
    func work(for customer: Customer)
    func scheduleWork(from customerQueue: Queue<Customer>) -> DispatchWorkItem
    static var serviceQueue: DispatchQueue { get }
}

extension Workable {
    func work(for customer: Customer) {
        print("\(customer.number)번 고객 \(customer.serviceType.message)업무 시작")
        Thread.sleep(forTimeInterval: processingTime)
        print("\(customer.number)번 고객 \(customer.serviceType.message)업무 완료")
    }
    
    func scheduleWork(from customerQueue: Queue<Customer>) -> DispatchWorkItem {
        let depositWorkItem = DispatchWorkItem {
            while customerQueue.isEmpty == false {
                var customer: Customer?
                Self.serviceQueue.sync {
                    customer = customerQueue.dequeue()
                }
                guard let customer = customer else {
                    return
                }
                self.work(for: customer)
            }
        }
        return depositWorkItem
    }
}
