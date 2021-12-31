import Foundation

protocol BankDelegate: AnyObject {
    func bank(didEnqueueCustomer customer: Customer)
    func bank(didChangeWorkTime workTime: Double)
}

final class Bank {
    private var loanCustomerQueue = Queue<Customer>()
    private var depositCustomerQueue = Queue<Customer>()
    private let loanBankersCount: Int
    private let depositBankersCount: Int
    private var numberOfCustomers = 0
    weak var delegate: BankDelegate?
    private var timer: Timer?
    private var workTime = 0.0 {
        didSet {
            delegate?.bank(didChangeWorkTime: workTime)
        }
    }
    
    init(loanBankersCount: Int = 1, depositBankersCount: Int = 2) {
        self.loanBankersCount = loanBankersCount
        self.depositBankersCount = depositBankersCount
    }
    
    func handOutWaitingNumber(from customerCount: Int) {
        let maxCount = numberOfCustomers + customerCount
        let waitingNumbers = numberOfCustomers..<maxCount
        for number in waitingNumbers {
            let customer = Customer(waitingNumber: number)
            customerQueue(customer.banking).enqueue(customer)
            delegate?.bank(didEnqueueCustomer: customer)
        }
        numberOfCustomers = maxCount
    }
    
    private func customerQueue(_ banking: Banking) -> Queue<Customer> {
        switch banking {
        case .loan:
            return loanCustomerQueue
        case .deposit:
            return depositCustomerQueue
        }
    }
    
    func open() {
        let isNotWorking = timer == nil
        guard isNotWorking else {
            return
        }
        startTimer()
        
        let bankGroup = DispatchGroup()

        workBankers(loanBankersCount, customers: loanCustomerQueue, group: bankGroup)
        workBankers(depositBankersCount, customers: depositCustomerQueue, group: bankGroup)
        
        bankGroup.notify(queue: DispatchQueue.global()) {
            self.timer?.invalidate()
            self.timer = nil
        }
    }
    
    private func workBankers(_ number: Int, customers: Queue<Customer>, group: DispatchGroup) {
        for _ in 1...number {
            workBanker(customers: customers, group: group)
        }
    }
    
    private func workBanker(customers: Queue<Customer>, group: DispatchGroup) {
        let banker = Banker()
        banker.delegate = delegate as? BankerDelegate
        DispatchQueue.global().async(group: group) {
            while let customer = customers.dequeue() {
                banker.work(for: customer)
            }
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { timer in
            self.workTime += 0.001
        }
    }
    
    func close() {
        self.numberOfCustomers = 0
        timer?.invalidate()
        workTime = 0
        loanCustomerQueue.clear()
        depositCustomerQueue.clear()
    }
}
