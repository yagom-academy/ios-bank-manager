import Foundation

struct BankManager {
    private let customerRange: ClosedRange = 10...30
    private let menuString = """
    1 : 은행개점
    2 : 종료
    입력 :
    """
    private let bankOpenMenu: String = "1"
    private let bankCloseMenu: String = "2"
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
        
        if input == bankOpenMenu {
            let bank = Bank(numberOfTeller, randomNumber(in: customerRange))
            bank.makeTellerWork()
            startBanking()
        } else if input == bankCloseMenu {
            return
        } else {
            startBanking()
        }
    }

    private func randomNumber(in range: ClosedRange<Int>) -> Int {
        return Int.random(in: range)
    }
}
