//
//  BankManager.swift
//  Created by OneTool, Red
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Bank {
    var customerQueue: Queue<DoubleStack<Int>>
    var workTime: Double = 0
    let numberOfCustomer = Int.random(in: 10...30)
    
    func printWorkStart(_ number: Int) {
        print("\(number)번 고객 업무 시작")
    }

    func printWorkEnd(_ number: Int) {
        print("\(number)번 고객 업무 종료")
    }

    mutating func work() {
        for number in 1...numberOfCustomer {
            printWorkStart(number)
            usleep(7000)
            printWorkEnd(number)
            workTime += 0.7
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
            work()
            print("업무가 마감 되었습니다.")
            print("오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무 시간은 \(String(format: "%.2f", workTime)) 입니다.")
        case 2:
            return
        default:
            print("잘못된 입력 입니다.")
        }
    }
}
