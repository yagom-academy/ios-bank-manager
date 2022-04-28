//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by 김태훈 on 2022/04/28.
//

import Foundation

class Banker {
    var customber: Customer?
    var numberOfOwnCustomer: Int = 0
    
    func printWorkStart(_ number: Int) {
        print("\(number)번 고객 업무 시작")
    }
    
    func printWorkEnd(_ number: Int) {
        print("\(number)번 고객 업무 종료")
    }
    
    func work() -> Double {
        var workTime: Double = 0
        for number in 1...numberOfOwnCustomer {
            printWorkStart(number)
            usleep(7000)
            printWorkEnd(number)
            workTime += 0.7
        }
        return workTime
    }
}
