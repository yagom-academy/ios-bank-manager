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
        print(NameSpace.input, terminator: NameSpace.blank)
        guard let input: Int = Int(readLine() ?? NameSpace.blank),
              let inputMenu: ConsoleAppMenu = ConsoleAppMenu(rawValue: input) else {
            print(NameSpace.wrongInput)
            return inputMenu()
        }
        return inputMenu
    }
    
    private mutating func startBankManager() {
        bankManager.reset()
        let customerCount: Int = Int.random(in: NameSpace.customerCountRange)
        bankManager.addCustomers(count: customerCount)
        bankManager.addBankers(bankBusiness: BankBusiness.deposit, count: NameSpace.depositBankerCount)
        bankManager.addBankers(bankBusiness: BankBusiness.loan, count: NameSpace.loanBankerCount)
        bankManager.startBank()
    }
    
    private func printMenuList() {
        for menu in ConsoleAppMenu.allCases {
            let menuInfo: String = NameSpace.menuInfo(menuNumber: menu.rawValue, menuDescription: menu.description)
            print(menuInfo)
        }
    }
}
