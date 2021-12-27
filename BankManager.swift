import Foundation

struct BankManager {
    static private var bank: Bank?
    
    static func createBank() {
        self.bank = Bank(numberOfBankClerk: 1)
    }
    
    static func openBank() {
        bank?.open()
    }
}
