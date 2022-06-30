//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by unchain, BaekGom on 2022/06/30.
//

import Foundation

struct Bank {
    var clerk: BankClerk
    var watingQueue: BankItemQueue<Customer>
    var customerCount: Int
    var businessHour: Double
    
    mutating func bankStart() {
        selectBankOpenAndClose()
    }
    
    func printBankInterface() {
        print("1 : 은행개점 \n2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    mutating func selectBankOpenAndClose() {
        printBankInterface()
        let requestInput = readLine()?.trimmingCharacters(in: .whitespaces) ?? "2"
        
        switch requestInput {
        case "1":
            clerk.handleBanking()
            bankStart()
        case "2":
            break
        default:
            bankStart()
        }
    }
}
