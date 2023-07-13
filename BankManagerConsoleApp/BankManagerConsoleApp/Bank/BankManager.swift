//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by kyungmin, Max on 2023/07/10.
//

struct BankManager {
    var bank: Bank
    
    mutating func work() {
        while selectMenu() == .open {
            bank.dailyWork()
        }
    }
    
    func selectMenu() -> Menu {
        Menu.displayMenu()
        print(Namespace.inputLabel, terminator: Namespace.inputTerminater)
        
        guard let inputMenu = readLine(),
              inputMenu == Menu.open.menuNumber else {
            return Menu.finish
        }
        
        return Menu.open
    }
}

extension BankManager {
    enum Namespace {
        static let inputLabel = "입력 : "
        static let inputTerminater = ""
    }
}
