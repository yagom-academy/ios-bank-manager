//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by ysp on 2021/04/27.
//

import Foundation

struct Bank {
    var numberOfBanker: Int
    var numberOfWaitingClient : Int
    var totalNumberOfClinet: Int
    var totalBusinessTime: Float// 소수점 두번째 자리가 출력하도록 구현이 안되어 있음

    func closeBusiness() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalNumberOfClinet)명이며, 총 업무시간은 초 \(totalBusinessTime)입니다.")
    }
}



