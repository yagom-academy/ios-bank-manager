//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

final class Bank {
    let bankManager = OperationQueue()
    
    func serveClient() {
        bankManager.maxConcurrentOperationCount = 1
        while true {
            var workTime = Double.zero
            displayMenu()
            let menuNumber = inputMenuNumber()
            switch menuNumber {
            case 1:
                let totalCustomer = customerNumber()
                for waitNumber in 1...totalCustomer {
                    let client = Client()
                    client.waitingNumber = waitNumber
                    bankManager.addOperation(client)
                    client.completionBlock = {
                        print("\(waitNumber)번 고객 업무 완료")
                        workTime += Double.duration
                    }
//                    client.waitUntilFinished()
                    bankManager.waitUntilAllOperationsAreFinished()
                }
                print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은\(String(format: "%.2f", workTime))초 입니다.")
                continue
            case 2:
                exit(0)
            default:
                print("잘못된 입력")
                continue
            }
        }
    }

    private func displayMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
    }

    private func inputMenuNumber() -> Int {
        guard let optionalInput = readLine(), let inputNumber = Int(optionalInput) else {
            return 0
        }
        return inputNumber
    }

    private func customerNumber() -> Int {
        return Int.random(in: 10...30)
    }
}

extension Double {
    static let duration = 0.7
}

Bank().serveClient()
