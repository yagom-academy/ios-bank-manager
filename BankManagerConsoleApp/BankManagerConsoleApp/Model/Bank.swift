import Foundation

class Bank {
    private var waitingLine = Queue<Customer>()
    private var bankClerk = BankClerk()
    
    func setWaitingLine(with numberOfCustomer: Int) {
        let totalNumber = numberOfCustomer
        for number in 1...totalNumber {
            waitingLine.enqueue(Customer(waitingNumber: number))
        }
    }
    
    private func dequeueWaitingLine() -> Customer? {
        return waitingLine.dequeue()
    }
    
    func startWork() {
        let depositQueue = DispatchQueue(label: "depositQueue", attributes: .concurrent)
        let loanQueue = DispatchQueue(label: "loanQueue")
        let workGroup = DispatchGroup()
        let semaphore = DispatchSemaphore(value: 2)
        
        var numberOfCustomer = 0
        
        let date = Date()
        
        while waitingLine.isEmpty == false {
            guard let customer = dequeueWaitingLine() else {
                fatalError("unknown error")
            }
            
            switch customer.task {
            case .deposit:
                depositQueue.async(group: workGroup) {
                    semaphore.wait()
                    self.bankClerk.handleTask(of: customer, until: BankTask.deposit.processingTime)
                    numberOfCustomer += 1
                    semaphore.signal()
                }
                
            case .loan:
                loanQueue.async(group: workGroup) {
                    self.bankClerk.handleTask(of: customer, until: BankTask.loan.processingTime)
                    numberOfCustomer += 1
                }
            default:
                return
            }
        }
        workGroup.wait()
        
        let taskTime = abs(date.timeIntervalSinceNow)
        close(totalCustomer: numberOfCustomer, taskTime: taskTime)
    }
    
    private func close(totalCustomer: Int, taskTime: Double) {
        let totalTime = taskTime
        let numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .up
        numberFormatter.minimumFractionDigits = 2
        guard let convertedTotalTime = numberFormatter.string(for: totalTime) else {
            return
        }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(convertedTotalTime)초입니다.")
    }
}
