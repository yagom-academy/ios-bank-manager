import Foundation

struct Bank {
    private var waitingLine = Queue<Customer>()
    private var bankClerk = BankClerk()
    
    mutating func setWaitingLine(with numberOfCustomer: Int) {
        let totalNumber = numberOfCustomer
        for number in 1...totalNumber {
            waitingLine.enqueue(Customer(waitingNumber: number))
        }
    }
    
    private mutating func dequeueWaitingLine() -> Customer {
        guard let customer = waitingLine.dequeue() else {
            fatalError("unknown error")
        }
        
        return customer
    }
    
    mutating func letClerkWork() {
        let taskTime = 0.7
        var numberOfCustomer = 0
        
        while waitingLine.isEmpty == false {
            let customer = dequeueWaitingLine()
            bankClerk.handleTask(of: customer, until: taskTime)
            numberOfCustomer += 1
        }
        close(totalCustomer: numberOfCustomer, taskTime: taskTime)
    }
    
    private func close(totalCustomer: Int, taskTime: Double) {
        let totalTime = taskTime * Double(totalCustomer)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .up
        numberFormatter.minimumFractionDigits = 2
        guard let convertedTotalTime = numberFormatter.string(for: totalTime) else {
            return
        }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(convertedTotalTime)초입니다.")
    }
}
