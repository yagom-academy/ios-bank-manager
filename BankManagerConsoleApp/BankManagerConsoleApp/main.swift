import Foundation

var bank = Bank()

func startBank() {
    print("1 : 은행 개장\n2 : 종료")
    print("입력 :", terminator: " ")
    
    guard let userInput = readLine() else {
        return
    }
    
    switch userInput{
    case "1":
        bank.configureBankers(numberOfBankers: 1)
        bank.configureCustomers(numberOfCustomers: UInt.random(in: 10...30))
        bank.openBank()
        startBank()
    case "2":
        exit(0)
    default:
        if userInput == "" {
            print(InputError.noInput.localizedDescription)
        } else {
            print(InputError.wrongInput.localizedDescription)
        }
        startBank()
    }
}

startBank()
