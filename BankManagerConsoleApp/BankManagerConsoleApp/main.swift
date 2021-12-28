import Foundation

func run() {
    let bank = Bank()
    var bankManager = BankManager(bank: bank)
    var isRunning = true
    while isRunning {
        bankManager.showMenu()
        isRunning = bankManager.receiveUserInput()
    }
}

run()
