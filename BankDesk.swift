//
//  BankDesk.swift
//  BankManagerConsoleApp
//
//  Created by goat, Andrew on 2023/03/09.
//

import Foundation

struct BankDesk {
    
    var bankManager = BankManager()
    
    func menuMessage(){
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    func inputBankingMenu() {
        menuMessage()
        while let inputNumber = readLine() {
            
            if inputNumber == "2" {
                print("종료")
                return
            } else if inputNumber == "1" {
                let customerCount = Int.random(in: 10...30)
                bankManager.bankCustomer = customerCount
                bankManager.manageBanking()
                menuMessage()
            } else {
                print("입력이 잘못 되었습니다.")
                menuMessage()
            }
        }
    }
}
