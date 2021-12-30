import Foundation

func run() {
    let bankManager = BankManager()
    var flag = true
    
    while flag {
        let selectedMenu = bankManager.selectMenu()
        
        switch selectedMenu {
        case Menu.bankOpen:
            bankManager.openBank()
        case Menu.exit:
            flag = false
            bankManager.exit()
        default:
            print("잘못된 입력입니다. 다시 입력해주세요.")
        }
    }
}

run()

