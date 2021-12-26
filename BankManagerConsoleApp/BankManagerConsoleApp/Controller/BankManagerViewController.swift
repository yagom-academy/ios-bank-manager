import Foundation

class BankManagerViewController {
    private var bankManager: BankManager
    private(set) var isFlag = true
    
    init(bankManager: BankManager) {
        self.bankManager = bankManager
        self.bankManager.delegate = self
    }
    
    func showMenu() {
        print(BankManagerMessage.menuList, terminator: "")
    }
    
    func receiveUserInput() {
        guard let input = readLine() else {
            return
        }
        bankManager.receivedUserInput(input)
    }
    
    private func showInvalidInput() {
        print(BankManagerMessage.wrongInput)
    }
    
    private func exit() {
        isFlag = false
    }
}

extension BankManagerViewController: BankManagerDelegate {
    func bankManagerDidReceiveInvalidInput() {
        showInvalidInput()
    }
    
    func bankManagerDidClose() {
        exit()
    }
}
