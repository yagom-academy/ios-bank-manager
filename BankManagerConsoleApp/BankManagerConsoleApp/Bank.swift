//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Sunny on 2021/05/03.
//

import Foundation

struct Bank {
    let queue = OperationQueue()
    
    func makeRandomNumberOfCustomers() -> Int {
        return Int.random(in: 10...30)
    }
    
    func displayConsoleMenu() {
        provideOption()
        let userNumberInput = receiveUserNumberInput()
        switch userNumberInput {
        case 1:
            queue.maxConcurrentOperationCount = 1
            let start = CFAbsoluteTimeGetCurrent()
            let numberOfCustomers = makeRandomNumberOfCustomers()
            for i in 1...numberOfCustomers {
                queue.addOperation {
                    print("\(i)번 고객 업무 시작")
                    usleep(700000)
                    print("\(i)번 고객 업무 완료")
                }
            }
            queue.waitUntilAllOperationsAreFinished()
            let end = CFAbsoluteTimeGetCurrent()
            informResult(start, end, numberOfCustomers)
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
    
    func informResult(_ start: Double, _ end: Double, _ totalNumberOfCustomers: Int) {
        let totalWorkTime = end - start
        let timeIsRunningOut = String(format: "%.2f", totalWorkTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalNumberOfCustomers)명이며, 총 업무시간은 \(timeIsRunningOut)초 입니다.")
    }
}
