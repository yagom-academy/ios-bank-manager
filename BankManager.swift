import Foundation

struct BankManager {
    private var bank: Bank?
    
    func run(numberOfBankClerk: Int = 1) {
        while true {
            printMenu()
            switch receiveInput() {
            case "1":
                let bank = Bank(clientQueue: Queue<Client>(), bankClerks: [], numberOfBanker: numberOfBankClerk)
                bank.open()
            case "2":
                return
            default:
                continue
            }
        }
    }
    
    func printMenu() {
        print("1 : 은행개점\n2 : 종료")
    }
    
    func receiveInput() -> String {
        print("입력 : ", terminator: "")
        guard let input = readLine() else {
            return ""
        }
        return input
    }
}
