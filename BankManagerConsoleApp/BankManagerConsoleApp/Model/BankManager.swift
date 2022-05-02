import Foundation

struct BankManager {
    private enum BankManagerMenu: String {
        case open = "1"
        case close = "2"
    }
    
    private let customerRange: ClosedRange = 10...30
    private let menuString = """
    1 : 은행개점
    2 : 종료
    입력 :
    """
    private let numberOfTeller: Int = 1
    
    func startBanking() {
        printMenu()
        inputMenu()
    }
    
    private func printMenu() {
        print(menuString, terminator: " ")
    }

    private func inputMenu() {
        guard let input = readLine() else {
            return
        }
        
        guard let menu: BankManagerMenu = BankManagerMenu(rawValue: input) else {
            startBanking()
            return
        }
        
        if menu == .open {
            let bank = Bank(numberOfTeller, generateRandomNumber(in: customerRange))
            bank.makeTellerWork()
            startBanking()
        } else if menu == .close {
            return
        }
    }

    private func generateRandomNumber(in range: ClosedRange<Int>) -> Int {
        return Int.random(in: range)
    }
}
