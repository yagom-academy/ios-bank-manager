import Foundation

enum Menu {
    static let open = "1"
    static let close = "2"
}

struct BankManager {
    private let bank: Bank
    
    init(bank: Bank = Bank()) {
        self.bank = bank
    }
    
    mutating func receiveUserInput() -> Bool {
        guard let input = readLine() else {
            showInvalidInput()
            return true
        }
        switch input {
        case Menu.open:
            setUpBankCustomers()
            bank.openBank()
            return true
        case Menu.close:
            return false
        default:
            showInvalidInput()
            return true
        }
    }
    
    private func setUpBankCustomers(to range: ClosedRange<Int> = 10...30) {
        let numberOfCustomers = Int.random(in: range)
        bank.handOutWaitingNumber(from: numberOfCustomers)
    }
    
    func showMenu() {
        print(BankManagerMessage.menuList, terminator: "")
    }
    
    private func showInvalidInput() {
        print(BankManagerMessage.wrongInput)
    }
}
