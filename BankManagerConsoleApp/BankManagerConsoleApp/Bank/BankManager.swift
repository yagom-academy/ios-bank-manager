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
        let bankers = createBankersInChargeOf(deposit: 2, loan: 1)
        let bank = Bank(bankers: bankers)
        
        guard var customers = try? createCustomers() else {
            return
        }
        
        bank.startBankService(&customers)
    }
    
    private func createBankersInChargeOf(deposit: Int, loan: Int) -> [Banker] {
        var bankers: [Banker] = []
        
        for _ in 0..<deposit {
            bankers.append(Banker(task: .deposit))
        }
        
        for _ in 0..<loan {
            bankers.append(Banker(task: .loan))
        }
        return bankers
    }
    
    private func createCustomers() throws -> [Customer] {
        let customerNumbers: ClosedRange<Int> = 10...30
        var customers = [Customer]()
        
        try customerNumbers.forEach { _ in
            guard let task = BankTask.allCases.randomElement() else {
                throw BankSystemError.noTask
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
