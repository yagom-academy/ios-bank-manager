//
//  ConsoleApp.swift
//  BankManagerConsoleApp
//
//  Created by junho, woong on 2022/11/03.
//

struct ConsoleApp {
    var bankManager: BankManager = BankManager()
    
    mutating func start() {
        ConsoleAppMenu.printMenuList()
        while inputMenu() == .startBank {
            startBankByCreatingBankManager()
            ConsoleAppMenu.printMenuList()
        }
    }
    
    private func inputMenu() -> ConsoleAppMenu {
        print("입력 :", terminator: " ")
        guard let input: Int = Int(readLine() ?? ""),
              let inputMenu: ConsoleAppMenu = ConsoleAppMenu(rawValue: input) else {
            print("다시 입력하세요.")
            return inputMenu()
        }
        return inputMenu
    }
    
    private mutating func startBankByCreatingBankManager() {
        bankManager.reset()
        let customerCount: Int = Int.random(in: 10...30)
        bankManager.addCustomers(count: customerCount)
        bankManager.addBankers(count: 1)
        bankManager.startBank()
    }
}
