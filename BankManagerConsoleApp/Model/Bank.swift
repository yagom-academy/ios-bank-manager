import Foundation

class Bank {
    
    lazy var bankClerk: [DispatchQueue] = []
    var customers: CustomerQueue = CustomerQueue<Int>()
    var numberOfCustomer: Int = 0
    
    init(numberOfBankClerk: Int, numberOfCustomer: Int) {
        bankClerk = makeCustomSerialQueue(amount: numberOfBankClerk)
        
        for index in 0..<numberOfCustomer {
            customers.enqueue(value: (index + 1))
        }
        
        self.numberOfCustomer = numberOfCustomer
    }
    
    func makeCustomSerialQueue(amount: Int) -> [DispatchQueue] {
        var customSerialQueues: [DispatchQueue] = []
        
        for index in 0..<amount {
            customSerialQueues.append((DispatchQueue(label: "BankClerkQueue\(index)")))
        }
        
        return customSerialQueues
    }
    
    func notifyClosing() {
        print("업무가 마감되었습니다, 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(Double(numberOfCustomer) * 0.7)초 입니다.")
    }
    
    func notifyStartingWork(of customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
    }
    
    func notifyFinisingWork(of customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 완료")
    }
}


