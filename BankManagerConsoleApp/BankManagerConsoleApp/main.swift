import Foundation

var bank = Bank()
var customers = [Customer]()
var taskTime: Double = 0.7

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
        configureCustomers()
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

func configureCustomers() {
    let numberOfCustomers:UInt = UInt.random(in: 10...30)
    for number in 1...numberOfCustomers {
        customers.append(Customer(waiting: number, taskTime: taskTime))
    }
}

startBank()
