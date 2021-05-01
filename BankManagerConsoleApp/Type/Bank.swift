//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by ysp on 2021/04/27.
//

import Foundation

class Bank {
    var totalNumberOfClinet: Int
    var totalBusinessTime: Float = 0
    
    init(totalNumberOfClinet: Int) {
        self.totalNumberOfClinet = totalNumberOfClinet
    }
    
    func closeBusiness() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalNumberOfClinet)명이며, 총 업무시간은 \(String(format: "%.2f",totalBusinessTime))초입니다.")
    }
}



