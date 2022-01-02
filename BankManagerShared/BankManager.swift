import Foundation

struct BankManager {
    static private var bank: Bank?
    
    static func createBank(delegate: BankDelegate) {
        self.bank = Bank(
            delegate: delegate,
            numberOfBankClerkForDeposit: 1,
            numberOfBankClerkForLoan: 2
        )
    }
    
    static func openBank() {
        bank?.open()
    }
    
    static func openBankForUI() {
        bank?.openForUI()
    }
    
    static func resetBankForUI() {
        bank?.reset()
    }
}
