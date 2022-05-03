import Foundation

struct Bank {
    private var numberOfTeller: Int
    private var numberOfCustomer: Int
    private let customerQueue: Queue = Queue<Customer>()
    private let teller: Teller = Teller()
    private let workTime: Double = 0.7
    
    init(_ numberOfTeller: Int, _ numberOfCustomer: Int) {
        self.numberOfTeller = numberOfTeller
        self.numberOfCustomer = numberOfCustomer
    }
    
    mutating func setUpCustomer(number: Int) {
        self.numberOfCustomer = number
        addCustomerInLine()
    }
    
    mutating func setUpTeller(number: Int) {
        self.numberOfTeller = number
    }
    
    private func addCustomerInLine() {
        for number in 1...numberOfCustomer {
            customerQueue.enqueue(Customer(number: number))
        }
    }
    
    func makeTellerWork() {
        while !customerQueue.isEmpty {
            guard let customer = customerQueue.dequeue() else {
                return
            }

            teller.work(for: customer)
        }
        
        let totalWorkTime = String(format: "%.2f", Double(numberOfCustomer) * workTime)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
}
