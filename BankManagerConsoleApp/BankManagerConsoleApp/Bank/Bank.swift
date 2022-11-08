//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/04.
//

import Foundation
import BankCustomerQueue

struct Bank: BankProtocol {
    private struct Constant {
        let invalidInputDescription: String = "잘못된 입력입니다."
        let bankOpenOption: String = "1"
        let bankCloseOption: String = "2"
        let menu: String = """
                           1 : 은행 개점
                           2 : 종료
                           입력 :
                           """
        let spacing: String = " "
        let customerCountRange: ClosedRange<Int> = 10...30
        func closingMent(_ customerCount: Int, _ workedTime: TimeInterval) -> String {
            let wasteTime = String(format: "%.2f", workedTime)
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(wasteTime)초입니다."
        }
    }
    
    private let constant: Constant = .init()
    private var bankerList: [Banker]
    private var bankCustomerQueue: BankCustomerQueue<BankCustomer>
    private var completedCustomerCount: Int = .zero
    private var totalWorkedTime: TimeInterval = .zero
    
    init(bankerCount: Int = 1) {
        self.bankerList = .init(repeating: Banker(), count: bankerCount)
        self.bankCustomerQueue = .init()
        let randomNumber = Int.random(in: constant.customerCountRange)
        
        for _ in 1...randomNumber {
            let bankCustomer: BankCustomer = .init(customerType: .deposit)
            bankCustomerQueue.enqueue(bankCustomer)
        }
    }
    
    mutating func open() {
        while true {
            floatingMenu()
            
            guard let menu = readLine() else {
                return
            }
            
            switch menu {
            case constant.bankOpenOption:
                let startPoint = Date()
                work()
                let endPoint = Date()
                self.totalWorkedTime = endPoint.timeIntervalSince(startPoint)
                close()
            case constant.bankCloseOption:
                return
            default:
                print(constant.invalidInputDescription)
            }
        }
    }
    
    private func floatingMenu() {
        print(constant.menu, terminator: constant.spacing)
    }
    
    private mutating func work() {
        let banker: Banker = bankerList.removeFirst()
        while let customer = bankCustomerQueue.dequeue() {
            banker.work(customer)
            completedCustomerCount += 1
        }
    }
    
    private func close() {
        print(constant.closingMent(completedCustomerCount, totalWorkedTime))
    }
}
