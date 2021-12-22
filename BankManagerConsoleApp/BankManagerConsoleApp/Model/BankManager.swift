import Foundation

struct BankManager {
    let bank = Bank()
    
    func selectMenu() {
        showMenu()
        
        let selectedMenu = input()
        
        switch selectedMenu {
        case "1": print("은행일")
        case "2": return
        default:
            print(Menu.inValidInput)
            selectMenu()
        }
    }
    
    func showMenu() {
        print(Menu.bankOpen)
        print(Menu.bankClose)
    }
    
    func input() -> String {
        print("입력: ",terminator: "")

        guard let selectedMenu = readLine() else {
            fatalError("입력 실패")
        }
        
        return selectedMenu
    }
}

extension BankManager {
    enum Menu {
        static let bankOpen = "1: 은행개점"
        static let bankClose = "2: 종료"
        static let inValidInput = "잘못된 입력입니다. 다시 입력해주세요."
    }
}
