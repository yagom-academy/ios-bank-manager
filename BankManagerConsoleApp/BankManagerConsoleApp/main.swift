//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bank: Bank = Bank(clerkCount: 1)
start()

func printMenu() {
    print("1: 은행 개점")
    print("2: 종료")
    print("입력: ", terminator: "")
}

func start() {
    printMenu()
    let menuNumber = readLine()
    switch menuNumber {
    case "1":
        setupRandomCustomerQueue()
        bank.open()
    case "2":
        bank.close()
    default:
        start()
    }
}

func setupRandomCustomerQueue() {
    let randomNumber = Int.random(in: 10...30)
    bank.customerCount = randomNumber
    Array(repeating: 0, count: randomNumber).enumerated().forEach { index, number in
        bank.customerQueue.enqueue(Customer(number: index+1))
    }
}
