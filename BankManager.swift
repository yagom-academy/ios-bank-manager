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
        
        var userInput: String {
            return self.rawValue
        }
    }
    
    private let clerk = Clerk()
    private let customerQueue = Queue<Customer>()
    private var numberOfCustomer: Int {
        return Int.random(in: 10...30)
    }
    
    private func receiveCustomers()  {
        for number in 1...numberOfCustomer {
            customerQueue.enqueue(data: Customer(waitingNumber: number))
        }
    }
    
    private func processTask() {
        receiveCustomers()
        var totalCustomer = 0
        var totalTaskTime: Double = 0
        while !customerQueue.isEmpty {
            guard let customer = customerQueue.dequeue() else {
                return
            }
            clerk.doTask(customer: Customer(waitingNumber: customer.waitingNumber))
            totalCustomer += 1
            totalTaskTime += clerk.businessProcessingTime
        }
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(String(format: "%.2f", totalTaskTime))초입니다.")
    }
    
    private func printMenu() -> Menu? {
        print("1 : 은행 개점\n2 : 종료\n입력 : ", terminator: "")
        guard let input = readLine() else {
            return nil
        }
        return Menu(rawValue: input)
    }
    
    func open() {
        var isContinue: Bool = true
        while isContinue {
            let menu = printMenu()
            switch menu {
            case .open:
                processTask()
            case .close:
                isContinue.toggle()
            default:
                print("다시 입력하세요.")
            }
        }
    }
}

