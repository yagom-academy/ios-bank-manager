//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    struct BankClient {
        var number: Int
        
        enum purpose: Int {
            case deposit = 1 //예금
        }
    }

    struct BankClerk {
        var bankWindowNumber: Int
        var taskState: Bool
        var client: BankClient? = BankClient(number: 0)
        
        mutating func task() {
            let startTime = NSDate().timeIntervalSince1970
            guard var number = client?.number else { return }
            let maxNumber = Int.random(in: 10...30)
            var clientArray = [Int](repeating: 0, count: maxNumber)
            for index in 0...maxNumber - 1 {
                clientArray[index] = index + 1
            }
            while number != maxNumber {
                print("\(clientArray[number])번 고객 업무 시작")
                makeWorkingTime()
                print("\(clientArray[number])번 고객 업무 완료")
                number += 1
            }
            let endTime = NSDate().timeIntervalSince1970
            printTheEnd(maxClient: maxNumber, startTime: startTime, endTime: endTime)
        }
        
        func makeWorkingTime() {
            let ms: Double = 1000000
            usleep(useconds_t(0.7 * ms))
        }
        
        func printTheEnd(maxClient: Int, startTime: Double, endTime: Double){
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(maxClient)명이며, 총 업무시간은 \(countOpenTime(startTime: startTime, endTime: endTime))초입니다.")
        }
        
        func countOpenTime(startTime: Double, endTime: Double) -> String {
            let taskTime = String(format: "%.2f", endTime - startTime)
            return taskTime
        }
    }
}
