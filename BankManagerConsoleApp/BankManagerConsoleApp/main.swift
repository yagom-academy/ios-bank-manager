import Foundation

func run() {
    let bankClerk = BankClerk()
    let bank = Bank(bankClerk: bankClerk)
    let bankManager = BankManager(bank: bank)
    let _ = BankViewController(bank: bank)
    let _ = BankClerkViewController(bankClerk: bankClerk)
    let bankManagerViewController = BankManagerViewController(bankManager: bankManager)
    while bankManagerViewController.isFlag {
        bankManagerViewController.showMenu()
        bankManagerViewController.receiveUserInput()
    }
}

run()
