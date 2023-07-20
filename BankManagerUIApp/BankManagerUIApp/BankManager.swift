//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    func selectMenu() {
        var isBankOpened: Bool = true
        
        while isBankOpened {
            print("1 : 은행개점")
            print("2 : 종료")
            print("입력 :", terminator: " ")
            let selection = readLine()
            
            switch selection {
            case numberOption.openBank:
                openBank()
            case numberOption.exit:
                isBankOpened = false
            default:
                print("잘못된 입력입니다.")
            }
        }
    }
    
    private func openBank() {
        let bankers = createBankers()
        var customers = createCustomers()
        var bank = Bank(bankers: bankers)
        
        bank.startBankService(&customers)
    }
    
    private func createBankers() -> [Banker] {
        let bankers = [Banker(task: .deposit),
                       Banker(task: .deposit),
                       Banker(task: .loan)]
        
        return bankers
    }
    
    private func createCustomers() -> [Customer] {
        let customerNumbers = Int.random(in: 10...30)
        var customers = [Customer]()
        
        for _ in 1...customerNumbers {
            guard let task = BankTask.allCases.randomElement() else {
                
                return customers //추후 에러처리
            }
            
            customers.append(Customer(task: task))
        }
        
        return customers
    }
}

extension BankManager {
    enum numberOption {
        static let openBank = "1"
        static let exit = "2"
    }
}
