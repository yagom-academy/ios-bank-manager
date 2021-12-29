import Foundation

struct BankManager {
    static private var bank: Bank?
    
    static func createBank(delegate: BankDelegate) {
        self.bank = Bank(delegate: delegate)
    }
    
    static func openBank() {
        bank?.open()
    }
}
