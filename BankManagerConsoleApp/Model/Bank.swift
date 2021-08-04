//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by kjs on 2021/07/28.
//

import Foundation

struct Bank {
    enum OperationStatus: Int {
        case open = 1
        case close = 2
    }
    
    enum BusinessType: Int, CaseIterable, CustomStringConvertible {
        case loan = 1
        case deposit = 2
        
        var requiredTime: TimeInterval {
            switch self {
            case .loan:
                return 1.1
            case .deposit:
                return 0.7
            }
        }
        
        var clerkNumber: UInt8 {
            switch self {
            case .loan:
                return 1
            case .deposit:
                return 2
            }
        }
        
        var description: String {
            switch self {
            case .loan:
                return "대출"
            case .deposit:
                return "예금"
            }
        }
    }
    
    private var customerQueue = Queue<Customer>()
    
    func receiveCustomer(range: ClosedRange<Int>) {
        for order in range {
            let randomNumber = Int.random(in: 1...BusinessType.allCases.count)
            guard let randomBusinessType = BusinessType(rawValue: randomNumber) else {
                continue
            }
            customerQueue.enqueue(value: Customer(id: order, businessType: randomBusinessType))
        }
    }

    func startBusiness() {
        let bankConfigure = configure()

        var customer: Customer?
        let group = DispatchGroup()
        while !customerQueue.isEmpty {
            group.enter()
            customer = customerQueue.dequeue()
            let targetQueue = bankConfigure.filter { bankTaskQueue in
                return customer?.businessType == bankTaskQueue.identify
            }[0]
            
            targetQueue.matchingClerkWith(customer: customer) {
                group.leave()
            }
        }
        
        let _ = group.wait(timeout: .distantFuture)
        endBusiness(after: customer)
    }
    
    private func endBusiness(after customer: Customer?) {
        guard let customer = customer else {
            return
        }
        let finishTime = Double(customer.id) * 0.7
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customer.id)명이며, 총 업무시간은 \(String(format: "%.2f", finishTime)) 입니다.")
    }
    
    private func configure() -> [BankTaskQueue] {
        return BusinessType.allCases.map { businessType -> BankTaskQueue in
            let thisBusinessTypeClerks = (1...businessType.clerkNumber).map { clerkNumber -> BankClerk in
                let id = businessType.rawValue * 100 + Int(clerkNumber)
                return BankClerk(id: id)
            }
            
            let bankTaskQueue = BankTaskQueue(
                identify: businessType,
                clerks: thisBusinessTypeClerks
            )
            return bankTaskQueue
        }
    }
}
