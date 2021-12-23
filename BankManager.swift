import Foundation

class BankManager {
    let bank: Bank
    
    init(bankName: String) {
        bank = Bank(bankName: bankName)
    }
}
