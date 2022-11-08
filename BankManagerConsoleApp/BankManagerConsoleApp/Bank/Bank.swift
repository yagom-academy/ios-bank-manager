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
        let invalidInput: String = "잘못된 입력입니다."
        let openOption: String = "1"
        let closeOption: String = "2"
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
    private var customerQueue: BankCustomerQueue<BankCustomer>
    private var completedCustomerCount: Int = .zero
    private var totalWorkedTime: TimeInterval = .zero
    
    init(bankerCount: Int = 1) {
        self.bankerList = .init(repeating: Banker(), count: bankerCount)
        self.customerQueue = .init()
        let randomNumber = Int.random(in: constant.customerCountRange)
        
        for _ in 1...randomNumber {
            let bankCustomer: BankCustomer = .init(customerType: .deposit)
            customerQueue.enqueue(bankCustomer)
        }
    }
    
    mutating func startBusiness() {
        while true {
            floatingMenu()
            
            let menu = readLine()
            
            switch menu {
            case constant.openOption:
                open()
            case constant.closeOption:
                return
            default:
                print(constant.invalidInput)
            }
        }
    }
    
    private func floatingMenu() {
        print(constant.menu, terminator: constant.spacing)
    }
    
    private mutating func open() {
        let startTime = Date()
        work()
        let endTime = Date()
        self.totalWorkedTime = endTime.timeIntervalSince(startTime)
        close()
    }
    
    private mutating func work() {
        let banker: Banker = bankerList.removeFirst()
        while let customer = customerQueue.dequeue() {
            banker.work(customer)
            completedCustomerCount += 1
        }
    }
    
    private func close() {
        print(constant.closingMent(completedCustomerCount, totalWorkedTime))
    }
}
