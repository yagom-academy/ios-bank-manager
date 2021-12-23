import Foundation

enum Menu {
    static let open = "1"
    static let close = "2"
}

struct BankManager {
    private let bank: Bank
    
    init(bank: Bank = Bank()){
        self.bank = bank
    }
    
    func receiveUserInput() -> Bool {
        guard let input = readLine(), input.isEmpty == false else {
            print(Message.wrongInput)
            return true
        }
        
        switch input {
        case Menu.open:
            getterCustomers()
            bank.openBank()
            return true
        case Menu.close:
            return false
        default:
            print(Message.wrongInput)
            return true
        }
    }
    
    func showMenu() {
        print(Message.menuList, terminator: "")
    }
    
    private func getterCustomers(to range: ClosedRange<Int> = 10...30) {
        let numberOfCustomers = Int.random(in: range)
        bank.handOutWaitingNumber(from: numberOfCustomers)
    }
}
