//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//


struct BankManager {
    
    var bank: Bank = Bank(clerkCount: 3, loanClerkCount: 1)

    func printMenu() {
        print("1: 은행 개점")
        print("2: 종료")
        print("입력: ", terminator: "")
    }

    mutating func start() {
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

    mutating func setupRandomCustomerQueue() {
        let randomNumber = Int.random(in: 10...30)
        bank.customerCount = randomNumber
        Array(repeating: 0, count: randomNumber).enumerated().forEach { index, number in
            guard let serviceType = Service.allCases.randomElement() else {
                return
            }
            bank.customerQueue.enqueue(Customer(number: index+1, serviceType: serviceType))
        }
    }
}
