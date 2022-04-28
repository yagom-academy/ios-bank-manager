import Foundation

struct Bank {
    let numberOfBankManager: Int
    let numberOfCustomer: Int
    let customerQueue: Queue = Queue<Customer>()
    let bankManager: BankManager = BankManager()
    
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
    
    private func makeBankManagerWork() {
        while !customerQueue.isEmpty {
            guard let customer = customerQueue.dequeue() else {
                return
            }
            
            bankManager.work(for: customer)
        }
        let workTime = Double(numberOfCustomer) * 0.7
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(String(format: "%.2f", workTime))")
    }
}
