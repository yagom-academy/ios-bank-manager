import Foundation

func run() {
    let bankClerk = Banker()
    let bank = Bank(bankClerk: bankClerk)
    var bankManager = BankManager(bank: bank)
    var isRunning = true
    while isRunning {
        bankManager.showMenu()
        isRunning = bankManager.receiveUserInput()
    }
}

run()
