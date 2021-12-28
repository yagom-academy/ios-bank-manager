import Foundation

func run() {
    var bankManager = BankManager()
    var isRunning = true
    while isRunning {
        bankManager.showMenu()
        isRunning = bankManager.receiveUserInput()
    }
}

run()
