//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private enum Menu: String {
        case open = "1"
        case close = "2"
    }
    enum Number {
        static let firstNumber = 1
        static let increaseOne = 1
        static let minimumNumber = 10
        static let maximumNumber = 30
    }
    
    private let clerk = Clerk()
    private let customerQueue = Queue<Customer>()
    private var numberOfCustomer = Int.random(in: Number.minimumNumber...Number.maximumNumber)
    
    private func processTask() {
        customers(customer: customerQueue)
        var totalCustomer = 0
        var totalTaskTime: Double = 0
        while !customerQueue.isEmpty {
            guard let customer = customerQueue.dequeue() else {
                return
            }
            clerk.doTask(customer: Customer(waitingNumber: customer.waitingNumber, businessType: customer.businessType))
            totalCustomer += Number.increaseOne
            totalTaskTime += customer.businessType.processingTime
        }
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(String(format: "%.2f", totalTaskTime))초입니다.")
    }
    
    private func printMenu() {
        print("1 : 은행 개점\n2 : 종료\n입력 : ", terminator: "")
    }
    
    private func getInputValue() -> Menu? {
        guard let input = readLine() else {
            return nil
        }
        return Menu(rawValue: input)
    }
    
    func open() {
        while true {
            printMenu()
            let menu = getInputValue()
            switch menu {
            case .open:
                processTask()
            case .close:
                return
            default:
                print("다시 입력하세요.")
            }
        }
    }
}

extension BankManager: Receivable {
    func customers(customer: Queue<Customer>) {
        for number in Number.firstNumber...numberOfCustomer {
            guard let customerType = BusinessType.allCases.randomElement() else { return }
            let customer = Customer(waitingNumber: number, businessType: customerType)
            customerQueue.enqueue(data: customer)
        }
    }
}
