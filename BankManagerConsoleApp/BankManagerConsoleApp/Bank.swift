//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/05/02.
//

import Foundation

fileprivate extension Const {
    static let defaultCount: Int = 0
    static let customerRange = 10...30
    static let startCount: Int = 1
    static let twoDecimal = "%.2f"
}

protocol Bankable {
    func manageBanker()
    func reportOfDay() -> String
}

final class Bank: Bankable {
    private var customers = Queue(listType: DoubleStack<Customer>())
    private var numberOfCustomer: Int = Const.defaultCount
    private var numberOfBankers: DispatchSemaphore
    private var wholeWorkTime: Double = Double.zero
    
    init(numberOfBankers: Int = Const.defaultBankerCount) {
        self.numberOfBankers = DispatchSemaphore(value: numberOfBankers)
        reset(numberOfBankers: numberOfBankers)
    }
    
    func manageBanker() {
        let banker = Banker()
        let workGroup = DispatchGroup()
        for _ in 1...numberOfCustomer {
            numberOfBankers.wait()
            let custormer = customers.deQueue()
            DispatchQueue.global().async(group: workGroup) {
                banker.work(customer: custormer)
                self.numberOfBankers.signal()
            }
            wholeWorkTime += Const.workTimeForCustomer
        }
        workGroup.wait()
    }
    
    func reportOfDay() -> String {
        let report = "오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무 시간은 \(String(format: Const.twoDecimal, wholeWorkTime))초 입니다."
        reset()
        return report
    }
    
    private func reset(numberOfBankers: Int = Const.defaultBankerCount) {
        numberOfCustomer = Int.random(in: Const.customerRange)
        for numberTicekt in Const.startCount...numberOfCustomer {
            customers.enQueue(data: Customer(numberTicekt: numberTicekt))
        }
        wholeWorkTime = 0
    }
}
