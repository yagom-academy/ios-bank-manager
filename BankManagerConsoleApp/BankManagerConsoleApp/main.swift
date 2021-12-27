import Foundation

func run() {
    let bankClerk = BankClerk(workSpeed: 0.7)
    let bank = Bank(bankClerk: bankClerk)
    var bankManager = BankManager(bank: bank)
    var isRunning = true
    while isRunning {
        bankManager.showMenu()
        isRunning = bankManager.receiveUserInput()
    }
}

run()
