//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

print("1 : 은행개점")
print("2 : 종료")
print("입력 : ", terminator: "")
let inputNumber = readLine()!

if inputNumber == "1" {
    let customer = Int.random(in: 10...30)
    for num in 1...customer {
        print("\(num)번 고객 업무 시작")
        print("\(num)번 고객 업무 종료")
    }
    print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총\(customer)명이며, 총 업무시간은 초입니다.")
} else if inputNumber == "2" {
    
} else {
    print("입력이 잘못 되었습니다.")
}
