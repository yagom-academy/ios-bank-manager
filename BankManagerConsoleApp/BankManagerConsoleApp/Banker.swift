//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by 이성노 on 2021/05/05.
//

import Foundation

struct Banker {
let numberOfBankers = 3
    func handleCustomers() {
        let userNumberInput = Bank().receiveUserNumberInput()
        
        switch userNumberInput {
           case 1:
                Bank().queue.maxConcurrentOperationCount = numberOfBankers
                let totalNumberOfCustomers = BankDirector().numberOfCustomers
                let start = CFAbsoluteTimeGetCurrent()
                for i in 1...totalNumberOfCustomers {
                    Bank().queue.addOperation {
                       print("\(i)번 고객 업무 시작")
                       usleep(700000)
                       print("\(i)번 고객 업무 완료")
                   }
                }
                Bank().queue.waitUntilAllOperationsAreFinished()
                let end = CFAbsoluteTimeGetCurrent()
                Bank().informResult(start, end, totalNumberOfCustomers)
                Bank().displayConsoleMenu()
            case 2:
                exit(0)
            default:
                print("잘못된 입력입니다.")
                Bank().displayConsoleMenu()
           }
    }
}
