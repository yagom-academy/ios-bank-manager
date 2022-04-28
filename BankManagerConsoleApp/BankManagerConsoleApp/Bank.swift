import Foundation

struct Bank {
    let numberOfBankManager: Int
    let numberOfCustomer: Int
    let customerQueue: Queue = Queue<Customer>()
    let bankManager: BankManager = BankManager()
    let workTime: Double = 0.7
    
    init(numberOfBankManager: Int, numberOfCustomer: Int) {
        self.numberOfBankManager = numberOfBankManager
        self.numberOfCustomer = numberOfCustomer
        makeCustomerInLine()
    }
    
    private func makeCustomerInLine() {
        for number in 1...numberOfCustomer {
            customerQueue.enqueue(Customer(number: number))
        }
    }
    
    func makeBankManagerWork() {
        while !customerQueue.isEmpty {
            guard let customer = customerQueue.dequeue() else {
                return
            }
            
            bankManager.work(for: customer, time: workTime)
        }
        
        let totalWorkTime = String(format: "%.2f", Double(numberOfCustomer) * workTime)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
}
