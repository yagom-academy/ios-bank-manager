//
//  Servable.swift
//  Created by sunnycookie, inho
//

import Foundation

protocol Servable {
    var processingTime: Double { get }
    var counter: DispatchQueue { get }
    func serve(customer: Customer, group: DispatchGroup)
}

extension Servable {
    func serve(customer: Customer, group: DispatchGroup) {
        counter.async(group: group) {
            print("\(customer.waitingNumber)번 고객 \(customer.bankingType.name)업무 시작")
            Thread.sleep(forTimeInterval: processingTime)
            print("\(customer.waitingNumber)번 고객 \(customer.bankingType.name)업무 종료")
        }
    }
}
