import Foundation

func run() {
    let bank = Bank()
    let bankManager = BankManager(bank: bank)
    let _ = BankViewController(bank: bank)
    let bankManagerViewController = BankManagerViewController(bankManager: bankManager)
    while bankManagerViewController.isFlag {
        bankManagerViewController.showMenu()
        bankManagerViewController.receiveUserInput()
    }
}

run()
