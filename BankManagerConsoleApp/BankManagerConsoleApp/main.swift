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
        bank.configureBankers(numberOfBankers: 3)
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
        let businessType:Int = Int.random(in: 1...2)
        taskTime = timeSetting(businessType)
        
        customers.append(Customer(waiting: number, taskTime: taskTime, priority: CustomerPriority(rawValue: Int.random(in: 1...3))!, businessType: BusinessType(rawValue: businessType)!))
    }
    customers.sort { $0.priority.rawValue < $1.priority.rawValue }
}

func timeSetting(_ type: Int) -> Double {
    var taskTime: Double
    if type == 1 {
        taskTime = 0.7
    } else {
        taskTime = 1.1
    }
    return taskTime
}

startBank()
