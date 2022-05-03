import Foundation

struct Bank {
    private var numberOfCustomer: Int
    private let customerQueue: Queue = Queue<Customer>()
    private let teller: Teller = Teller()
    private let workTime: Double = 0.7
    private let depositWindow: DispatchSemaphore = DispatchSemaphore(value: 2)
    private let loanWindow: DispatchSemaphore = DispatchSemaphore(value: 1)
    
    init(_ numberOfCustomer: Int) {
        self.numberOfCustomer = numberOfCustomer
    }
    
    mutating func setUpCustomer(number: Int) {
        self.numberOfCustomer = number
        addCustomerInLine()
    }
    
    private func addCustomerInLine() {
        for number in 1...numberOfCustomer {
            customerQueue.enqueue(Customer(number: number))
        }
    }
    
    func makeTellerWork() {
        let bankingGroup = DispatchGroup()
        
        while !customerQueue.isEmpty {
            guard let customer = customerQueue.dequeue() else {
                return
            }
            
            guard let task = customer.taskType else {
                return
            }
            
            switch task {
            case .deposit:
                depositWindow.wait()
                DispatchQueue.global().async(group: bankingGroup) {
                    teller.work(for: customer)
                    depositWindow.signal()
                }
            case .loan:
                loanWindow.wait()
                DispatchQueue.global().async(group: bankingGroup) {
                    teller.work(for: customer)
                    loanWindow.signal()
                }
            }
        }
        
        bankingGroup.wait()
        let totalWorkTime = String(format: "%.2f", Double(numberOfCustomer) * workTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
}
