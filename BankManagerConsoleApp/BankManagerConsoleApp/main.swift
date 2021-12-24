import Foundation

struct MenuHandler {
    enum Menu: String {
        case one = "1"
        case two = "2"
    }
    
    func startToReceiveInput() {
        print("""
           1: 은행개점
           2: 종료
           입력:
           """, terminator: "")
        
        guard let input = readLine(), input.isEmpty == false else {
            return
        }
        
        switch input {
        case "1":
            setBankWithRandomCustomer()
            startToReceiveInput()
            return
        case "2":
            return
        default:
            return
        }
    }
    
    private func setBankWithRandomCustomer() {
        let randomNumberOfCustomer = Int.random(in: 10...30)
        var bank = Bank(numberOfBankClerk: 1, numberOfCustomer: randomNumberOfCustomer)
        bank.openBank()
    }
}

func startBankManager() {
    let menuHandler = MenuHandler()
    menuHandler.startToReceiveInput()
}

startBankManager()
