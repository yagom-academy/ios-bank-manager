import Foundation

enum WorkType: String, CaseIterable {
    case deposit = "예금"
    case loans = "대출"
}

struct Customer {
    let ticketNumber: Int
    let work: WorkType
}

func createCustomers() -> [Customer] {
    var customers: [Customer] = []
    
    for turn in 0..<10 {
        guard let work = WorkType.allCases.randomElement() else { return [] }
        let newCustomer: Customer = Customer(ticketNumber: turn, work: work)
        customers.append(newCustomer)
    }
    return customers
}


// 뽑아서 고객을 본다.      -> 예금 업무 하는 사람 1
                    // -> 예금 업무 하는 사람 2
                    // -> 대출 업무를 보는 사람
class Banker {
    var isWorked: Bool = false
    
    func work() {
        
    }
}


func startWork() {
    let operation = OperationQueue()
    operation.maxConcurrentOperationCount = 2
    let dipositBanker = Banker()
    let dipositBanker2 = Banker()
    
    let loanOperation = DispatchQueue.init(label: "loan")
    
    
    while !customer.isEmpty {
        let value = customer.removeFirst()
        
        switch value.work {
        case .deposit:
            operation.addOperation {
                print("start \(value.ticketNumber) \(value.work)")
                usleep(700000)
                print("end ",value.ticketNumber, value.work)
            }
            
        case .loans:
            loanOperation.async {
                print("start \(value.ticketNumber) \(value.work)")
                usleep(1100000)
                print("end ",value.ticketNumber, value.work)
            }
        }
    }
}
var customer = createCustomers()
startWork()
