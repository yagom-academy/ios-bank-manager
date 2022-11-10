//
//  ConsoleApp.swift
//  BankManagerConsoleApp
//
//  Created by junho, woong on 2022/11/03.
//

struct ConsoleApp {
    private var bankManager: BankManager = BankManager()
    
    mutating func start() {
        printMenuList()
        while inputMenu() == .startBank {
            startBankManager()
            printMenuList()
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
    
    private mutating func startBankManager() {
        bankManager.reset()
        let customerCount: Int = Int.random(in: 10...30)
        bankManager.addCustomers(count: customerCount)
        bankManager.addBankers(bankBusiness: BankBusiness.deposit, count: 2)
        bankManager.addBankers(bankBusiness: BankBusiness.loan, count: 1)
        bankManager.startBank()
    }
    
    private func printMenuList() {
        for menu in ConsoleAppMenu.allCases {
            let menuInfo: String = "\(menu.rawValue) : \(menu.description)"
            print(menuInfo)
        }
    }
}
