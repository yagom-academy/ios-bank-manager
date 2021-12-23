import Foundation

let bank = BankManager()

func run() {
    var flag = true

    while flag {
        bank.showMenu()
        flag = bank.receiveUserInput()
    }
}

run()
