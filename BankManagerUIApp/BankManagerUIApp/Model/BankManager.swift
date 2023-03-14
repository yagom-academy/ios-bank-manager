//
//  BankManager.swift
//  Created by brody, christy, harry.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    func start() {
        var isSelectedOpen = true
        
        while isSelectedOpen {
            print("1 : 은행개점")
            print("2 : 종료")
            print("입력 : ", terminator: "")
            
            guard let userInput = readLine() else { continue }
            
            switch userInput {
            case "1":
                var bank = Bank()
                let numberOfCustomer = Int.random(in: 10...30)
                
                bank.receive(numberOfCustomer)
                bank.startBusiness()
            case "2":
                isSelectedOpen = false
            default:
                print()
                
                continue
            }
        }
    }
}
