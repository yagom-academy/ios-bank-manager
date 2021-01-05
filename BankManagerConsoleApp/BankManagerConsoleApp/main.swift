import Foundation

var bankManager = BankManager()

func startBank() {
    print("1 : 은행 개장\n2 : 종료")
    print("입력 :", terminator: " ")
    
    guard let userInput = Int(readLine()!) else {
        fatalError("잘못된 입력값 입니다!")
    }
    
    switch userInput {
    case 1:
        bankManager.configureBankers(numberOfBankers: 1)
        bankManager.configureCustomers(numberOfCustomers: UInt.random(in: 10...30))
        bankManager.openBank()
        startBank()
    case 2:
        exit(0)
    default:
        print("잘못된 입력값 입니다!")
    }
}

startBank()
