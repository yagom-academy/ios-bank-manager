import Foundation

class Bank {
    private var waitingLine = Queue<Customer>()
    private var bankClerk = BankClerk()
    
    weak var delegate: BankDelegate?

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
    
    func start() {
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
        delegate?.didFinishWork(totalCustomer: totalCustomer, workingTime: workingTime)
        totalCustomer = 0
    }
}
