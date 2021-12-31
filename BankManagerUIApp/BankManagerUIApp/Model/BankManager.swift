import Foundation

struct BankManager {
    private var bank: Bank?
    
    init(bank: Bank?) {
        self.bank = bank
    }
    
    mutating func openBank(to range: ClosedRange<Int> = 10...10) {
        let numberOfCustomers = Int.random(in: range)
        bank?.handOutWaitingNumber(from: numberOfCustomers)
        bank?.open()
    }
    
    func closeBank() {
        bank?.close()
    }
}
