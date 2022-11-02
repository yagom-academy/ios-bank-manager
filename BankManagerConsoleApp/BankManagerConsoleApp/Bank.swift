//  Bank.swift
//  BankManagerConsoleApp
//  Created by Baem & Bella on 2022/11/02.

import Foundation

struct Bank {
    private let manager: Int
    private var lineOfCustomer: Int
    private var randomNumber: Int
    
    func selectMenu() {
     print(" 1 : 은행개점\n 2 : 종료\n입력 :")
        switch receiveUserInput() {
        case "1":
            startTask()
        case "2":
            return
        default:
            print("잘못된 입력값입니다. 다시 입력해주세요.")
            selectMenu()
        }
    }
    
    func receiveUserInput() -> String {
        guard let userInput = readLine() else {
            return receiveUserInput()
        }
        return userInput
    }
    
    func startTask() {
        
    }
}
