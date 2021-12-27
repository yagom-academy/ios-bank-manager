import Foundation

struct BankManager {
    private var bank: Bank?
    
    func run(numberOfBankClerk: Int = 1) {
        while true {
            printMenu()
            switch receiveInput() {
            case ConsoleBundle.Menu.open:
                let bank = Bank(numberOfBankClerk: numberOfBankClerk)
                bank.open()
            case ConsoleBundle.Menu.exit:
                return
            default:
                continue
            }
        }
    }
    
    func printMenu() {
        print(ConsoleBundle.Menu.explainMessage)
    }
    
    func receiveInput() -> String {
        print(ConsoleBundle.Menu.inputMessage, terminator: "")
        guard let input = readLine() else {
            return ""
        }
        return input
    }
}
