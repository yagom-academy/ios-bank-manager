//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by ysp on 2021/04/27.
//

import Foundation

struct Bank {
    private var numberOfBanker: Int
    private var numberOfWaitingClient = Int.random(in: 10...30)
    var totalNumberOfClinet: Int
    static var totalBusinessTime: Float = 0 // 소수점 두번째 자리가 출력하도록 구현이 안되어 있음

    
    mutating func closeBusiness() {
        if numberOfWaitingClient == totalNumberOfClinet {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalNumberOfClinet)명이며, 총 업무시간은 초 \(Bank.totalBusinessTime)입니다.")
        } else {
            numberOfWaitingClient += 1
        }
    }
}



