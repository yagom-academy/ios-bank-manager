import Foundation

struct BankManager {
    private var bank: Bank
    
    init(bank: Bank) {
        self.bank = bank
    }
    
    func run() {
        while true {
            printMenu()
            receiveInput()
        }
    }
    
    func printMenu() {
        
    }
    
    func receiveInput() {
        
    }
}
