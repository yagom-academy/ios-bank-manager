//  BankManagerConsoleApp - Console.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

struct Console {
    func start() {
        while true {
            print("1 : 은행개점")
            print("2 : 종료")
            print("입력 : ", terminator: "")
            
            guard let input: String = readLine(),
                  let flag: Int = Int(input),
                  Array(1...2).contains(flag) == true else {
                continue
            }
            
            if flag == 1 {
                var bank: Bank = Bank()
                bank.setCustomerQueue()
                bank.startBankingService()
                print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 10명이며, 총 업무시간은 7.00초입니다.")
            } else {
                return
            }
        }
    }
}
