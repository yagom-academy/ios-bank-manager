import Foundation

enum Menu {
    static let open = "1"
    static let close = "2"
}

struct BankManager {
    private let bank: Bank
    var delegate: BankManagerDelegate?
    
    init(bank: Bank = Bank()) {
        self.bank = bank
    }
    
    mutating func receivedUserInput(_ input: String) {
        switch input {
        case Menu.open:
            getterCustomers()
            bank.openBank()
        case Menu.close:
            delegate?.bankManagerDidFinish()
            return
        default:
            delegate?.bankManagerDidInvalidInput()
        }
    }
    
    private func getterCustomers(to range: ClosedRange<Int> = 10...30) {
        let numberOfCustomers = Int.random(in: range)
        bank.handOutWaitingNumber(from: numberOfCustomers)
    }
}
