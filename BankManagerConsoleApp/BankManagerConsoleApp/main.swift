//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import BankManager

run()

func run() {
    printMenu()
    inputMenu()
}

func inputMenu() {
    let input = readLine()

    if input! == "1" {
        var bank = Bank()
        let randomNumber = Int.random(in: 10...30)
        
        for _ in 0..<randomNumber {
            bank.clients.enqueue(element: Client())
        }
        
        while !bank.clients.isEmpty {
            bank.manager.startTask()
            bank.clients.dequeue()
            bank.manager.endTask()
        }
        
        bank.manager.finishTasks()
    } else if input! == "2" {
        return
    }
    
    run()
}

func printMenu() {
    print("1 : 은행 개점\n2 : 종료")
    print("입력 : ", terminator: "")
}
