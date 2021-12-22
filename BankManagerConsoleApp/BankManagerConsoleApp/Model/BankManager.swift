import Foundation

struct BankManager {
    let bank = Bank()
    
    func selectMenu() {
        print("1: 은행개점")
        print("2: 종료")
        print("입력: ",terminator: "")
        
        guard let selectedMenu = readLine() else {
            return
        }
    }
}
