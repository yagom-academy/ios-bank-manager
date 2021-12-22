import Foundation

struct BankManager {
    private let bank = Bank(bankClerk: BankClerk(workSpeed: 0.7))
    
    func receiveUserInput() -> Bool {
        guard let input = readLine(), input.isEmpty == false else {
            print("잘못된 입력입니다. 다시 확인해주세요.")
            return true
        }
        
        switch input {
        case "1":
            bank.openBank()
            return true
        case "2":
            return false
        default:
            print("잘못된 입력입니다. 다시 확인해주세요.")
            return true
        }
    }
    
    func showMenu() {
        print("""
        1 : 은행 개점
        2 : 종료
        입력 :
        """, terminator: "")
    }
    
    func getterCustomers(to range: ClosedRange<Int> = 10...30) {
        let numberOfCustomers = Int.random(in: range)
        bank.handOutWaitingNumber(from: numberOfCustomers)
    }
}
