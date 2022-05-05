//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/05/02.
//

import Foundation

fileprivate extension Const {
    static let defaultCount: Int = 0
    static let startTime: Double = 0
    static let customerRange = 10...30
    static let startCount: Int = 1
}

final class Bank: Manageable {
    private var customers = Queue(listType: DoubleStack<Customer>())
    private var numberOfCustomer: Int = Const.defaultCount
    let workGroup = DispatchGroup()
    let depositQueue = OperationQueue()
    let loanQueue = OperationQueue()
    
    init() {
        reset()
        depositQueue.maxConcurrentOperationCount = BankTask.deposit.numberOfBankers
        loanQueue.maxConcurrentOperationCount = BankTask.loan.numberOfBankers
    }
    
    func resetAll() {
        depositQueue.cancelAllOperations()
        loanQueue.cancelAllOperations()
        numberOfCustomer = 0
    }
    
    func addTenCustomer() {
        let startNumberOfCumstomer = numberOfCustomer + 1
        let newNumberOfCumstomer = numberOfCustomer + 10
        for numberTicekt in startNumberOfCumstomer...newNumberOfCumstomer {
            let customer = Customer(numberTicekt: numberTicekt)
            customers.enQueue(data: customer)
            NotificationCenter.default.post(name: .addCustomerAlram, object: nil, userInfo: ["oneCustomer": customer])
        }
        numberOfCustomer += 10
        manageBanker()
    }
    
    func manageBanker() {
        let banker = Banker()
        while !customers.isEmpty {
            guard let custormer = customers.deQueue(), let task = custormer.task else {
                return
            }
            workGroup.enter()
            switch task {
            case .deposit:
                depositQueue.addOperation {
                    banker.work(customer: custormer)
                    self.workGroup.leave()
                }
            case .loan:
                loanQueue.addOperation {
                    banker.work(customer: custormer)
                    self.workGroup.leave()
                }
            }
        }
        workGroup.notify(queue: .main) {
            NotificationCenter.default.post(name: .timer, object: nil)
        }
    }
    
    private func makeSemaphore() -> [BankTask: DispatchSemaphore] {
        var semaphores: [BankTask: DispatchSemaphore] = [:]
        for task in BankTask.allCases {
            semaphores[task] = .init(value: task.numberOfBankers)
        }
        return semaphores
    }
    
    private func reset() {
        numberOfCustomer = Int.random(in: Const.customerRange)
        for numberTicekt in Const.startCount...numberOfCustomer {
            let customer = Customer(numberTicekt: numberTicekt)
            customers.enQueue(data: customer)
            NotificationCenter.default.post(name: .addCustomerAlram, object: nil, userInfo: ["oneCustomer": customer])
        }
    }
}
