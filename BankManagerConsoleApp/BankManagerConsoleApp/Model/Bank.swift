import Foundation

class Bank {
    private var waitingLine = Queue<Customer>()
    private var bankClerk = BankClerk()

    private let depositQueue = DispatchQueue(label: "depositQueue", attributes: .concurrent)
    private let loanQueue = DispatchQueue(label: "loanQueue")
    private let sequenceQueue = DispatchQueue(label: "sequenceQueue")
    
    private var totalCustomer = 0
    
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
        let date = Date()
        
        work()
        
        let taskTime = abs(date.timeIntervalSinceNow)
        finishWork(workingTime: taskTime)
    }
    
    private func work() {
        let workGroup = DispatchGroup()
        let semaphore = DispatchSemaphore(value: 2)
        
        while waitingLine.isEmpty == false {
            guard let customer = dequeueWaitingLine() else {
                fatalError("unknown error")
            }
            
            switch customer.task {
            case .deposit:
                sequenceQueue.async { [self] in
                    depositQueue.async(group: workGroup) {
                        semaphore.wait()
                        bankClerk.handleTask(of: customer)
                        totalCustomer += 1
                        semaphore.signal()
                    }
                }
            case .loan:
                loanQueue.async(group: workGroup) { [self] in
                    bankClerk.handleTask(of: customer)
                    totalCustomer += 1
                }
            default:
                return
            }
        }
        workGroup.wait()
    }
    
    private func finishWork(workingTime: Double) {
        let totalTime = String(format: "%.2f", workingTime)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(totalTime)초입니다.")
        totalCustomer = 0
    }
}
