import Foundation

var bank = Bank()
var customers = [Customer]()

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
    let numberOfCustomers: UInt = UInt.random(in: 10...30)
    
    for number in 1...numberOfCustomers {
        guard let businessType = BusinessType.allCases.randomElement(),
              let customerPriority = Customer.Priority.allCases.randomElement() else {
            fatalError("고객을 만들 수 없습니다!")
        }
        let taskTime = duration(businessType)
        let customer = Customer(waiting: number, taskTime: taskTime, businessType: businessType, priority: customerPriority)
        customers.append(customer)
    }
    customers.sort { $0.priority.rawValue < $1.priority.rawValue }
}

func duration(_ type: BusinessType) -> Double {
    var taskTime: Double
    switch type {
    case .loan:
        taskTime = 0.3
    case .deposit:
        taskTime = 0.7
    }
    return taskTime
}

startBank()
