import Foundation

var bank = Bank()

func startBank() {
    print("1 : 은행 개장\n2 : 종료")
    print("입력 :", terminator: " ")
    
    guard let userInput = readLine() else {
        print(InputError.wrongInput.localizedDescription)
        return startBank()
    }
    
    switch userInput {
    case "1":
        bank.configureBankers(numberOfBankers: 1)
        bank.configureCustomers(numberOfCustomers: UInt.random(in: 10...30))
        bank.openBank()
    case "2":
        exit(0)
    case "":
        print(InputError.noInput.localizedDescription)
    default:
        print(InputError.wrongInput.localizedDescription)
    }
    startBank()
}

startBank()
