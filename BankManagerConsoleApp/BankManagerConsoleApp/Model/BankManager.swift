import Foundation

enum Menu {
    static let bankOpen = "1"
    static let bankClose = "2"
}

struct BankManager {
    var bank = Bank()

    func showMenu() {
        print("1: 은행개점")
        print("2: 종료")
        print("입력: ",terminator: "")
    }
    
    func selectMenu() -> String? {
        showMenu()
        let selectedMenu = readLine()
        
        return selectedMenu
    }
    
    mutating func openBank() {
        bank.setWaitingLine(with: generateNumberOfCustomer)
        bank.letClerkWork()
    }
    
    func closeBank() {
        return 
    }
    
    func generateNumberOfCustomer() -> Int {
        let range: ClosedRange<Int> = 10...30
        let numberOfCustomer = Int.random(in: range)
        
        return numberOfCustomer
    }
}
