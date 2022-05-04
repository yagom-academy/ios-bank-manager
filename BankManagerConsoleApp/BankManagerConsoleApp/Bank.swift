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
    
    static let twoDecimal = "%.2f"
}

final class Bank: Manageable {
    private var customers = Queue(listType: DoubleStack<Customer>())
    private var numberOfCustomer: Int = Const.defaultCount
    private var wholeWorkTime: Double = Double.zero
    
    init(numberOfBankers: Int = Const.defaultBankerCount) {
        reset(numberOfBankers: numberOfBankers)
    }
    
    func recordTime(method: () -> Void) {
        let startTime = CFAbsoluteTimeGetCurrent()
        method()
        wholeWorkTime = CFAbsoluteTimeGetCurrent() - startTime
    }
    
    func manageBanker() {
        let banker = Banker()
        let workGroup = DispatchGroup()
        let semaphores = makeSemaphore()
        for _ in Const.startCount...numberOfCustomer {
            guard let custormer = customers.deQueue(), let task = custormer.task else {
                return
            }
            semaphores[task]?.wait()
            DispatchQueue.global().async(group: workGroup) {
                banker.work(customer: custormer)
                semaphores[task]?.signal()
            }
        }
        workGroup.wait()
    }
    
    func reportOfDay() -> String {
        let report = "오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무 시간은 \(String(format: Const.twoDecimal, wholeWorkTime))초 입니다."
        reset()
        return report
    }
    
    private func makeSemaphore() -> [BankTask: DispatchSemaphore] {
        var semaphores: [BankTask: DispatchSemaphore] = [:]
        for task in BankTask.allCases {
            semaphores[task] = .init(value: task.numberOfBankers)
        }
        return semaphores
    }
    
    private func reset(numberOfBankers: Int = Const.defaultBankerCount) {
        numberOfCustomer = Int.random(in: Const.customerRange)
        for numberTicekt in Const.startCount...numberOfCustomer {
            customers.enQueue(data: Customer(numberTicekt: numberTicekt))
        }
        wholeWorkTime = Const.startTime
    }
}
