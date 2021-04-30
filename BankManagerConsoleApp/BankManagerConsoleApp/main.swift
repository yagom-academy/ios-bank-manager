//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func makeRandomNumberOfCustomers() -> Int {
    return Int.random(in: 10...30)
}

let numberOfCustomers = makeRandomNumberOfCustomers()

struct Bank {
    func displayConsoleMenu() {
        provideOption()
        let userNumberInput = receiveUserNumberInput()
        switch userNumberInput {
        case 1:
            for i in 1...numberOfCustomers {
                print("\(i)번 고객 업무 시작")
                usleep(700000)
                print("\(i)번 고객 업무 완료")
            }
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomers)명이며, 총 업무시간은 \(Double(numberOfCustomers) * 0.7)초 입니다.")
            displayConsoleMenu()
        case 2:
            exit(0)
        default:
            print("잘못된 입력입니다.")
            displayConsoleMenu()
        }
    }

    func provideOption() {
        print("1 : 은행개점")
        print("2 : 종료")
    }
    
    func receiveUserNumberInput() -> Int {
        guard let optionalInput = readLine(), let inputNumber = Int(optionalInput) else { return 0 }
        return inputNumber
    }
}

Bank().displayConsoleMenu()
