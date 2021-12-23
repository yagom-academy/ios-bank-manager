import Foundation

class BankManagerViewController {
    private var bankManager = BankManager()
    private(set) var isFlag = true
    
    init() {
        bankManager.delegate = self
    }
    
    func showInvalidInput() {
        print(Message.wrongInput)
    }
    
    func exit() {
        isFlag = false
    }
    
    func showMenu() {
        print(Message.menuList, terminator: "")
    }
    
    func receiveUserInput() {
        guard let input = readLine() else {
            return
        }
        bankManager.receivedUserInput(input)
    }
}

extension BankManagerViewController: BankManagerDelegate {
    func bankManagerDidInvalidInput() {
        showInvalidInput()
    }
    
    func bankManagerDidFinish() {
        exit()
    }
}
