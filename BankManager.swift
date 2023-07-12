//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by kyungmin, Max on 2023/07/10.
//

struct BankManager {
    var bank: Bank
    
    mutating func workBankManager() {
        while selectMenu() == .open {
            bank.dailyWork()
        }
    }
    
    func selectMenu() -> Menu {
        Menu.displayMenu()
        print("입력 : ", terminator: "")
        guard let inputMenu = readLine(),
              let menu = Menu(rawValue: inputMenu),
              menu == .open else {
            return Menu.finish
        }
        
        return Menu.open
    }
}
