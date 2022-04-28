//
//  BankManager.swift
//  Created by OneTool, Red
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Customer {
    let numberTicekt: Int
}

final class BankManager {
    private var bankers: [Banker] = []
    private var customers = Queue(listType: DoubleStack<Customer>())
    private var numberOfCustomer: Int = 0
    private var wholeWorkTime: Double = 0
    
    init(numberOfBanker: Int = 1) {
        initialize(numberOfBanker: numberOfBanker)
    }
    
    private func initialize(numberOfBanker: Int = 1) {
        numberOfCustomer = Int.random(in: 10...30)
        for numberTicekt in 1...numberOfCustomer {
            customers.enQueue(data: Customer(numberTicekt: numberTicekt))
        }
        
        for _ in 1...numberOfBanker {
            bankers.append(Banker())
        }
    }
    
    mutating func distributeCustomer() {
        _ = bankers.map { banker in
            if customers.isEmpty == false {
                let customer = customers.deQueue()
                banker.customer = customer
                banker.work()
                workTime += 0.7
            }
        }
    }
    
    mutating func startWork() {
        while customers.isEmpty == false {
            distributeCustomer()
        }
    }
    
    mutating func openBank() {
        print("1 : 은행 개점\n2 : 종료\n입력 : ", terminator: "")
        let userChoice = readLine()!
        guard let userNumber = Int(userChoice) else {
            print("잘못된 입력 입니다.")
            return
        }
        
        switch userNumber {
        case 1:
            startWork()
            print("업무가 마감 되었습니다.")
            print("오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무 시간은 \(String(format: "%.2f", workTime))초 입니다.")
        case 2:
            return
        default:
            print("잘못된 입력 입니다.")
        }
    }
}

