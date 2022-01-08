import Foundation

protocol BankDelegate: BankProtocol { }

final class Bank {
    private var loanCustomerQueue = Queue<Customer>() {
        didSet {
            workBankers(loanBankersCount, customers: loanCustomerQueue, group: bankGroup)
        }
    }
    private var depositCustomerQueue = Queue<Customer>() {
        didSet {
            workBankers(depositBankersCount, customers: depositCustomerQueue, group: bankGroup)
        }
    }
    private let loanBankersCount: Int
    private let depositBankersCount: Int
    private var numberOfCustomers = 0
    private var timer: Timer?
    private let bankGroup = DispatchGroup()
    private var workTime = 0.0 {
        didSet {
            delegate?.bank(didChangeWorkTime: workTime)
        }
    }
    weak var delegate: BankProtocol?
    
    init(loanBankersCount: Int = 1, depositBankersCount: Int = 2) {
        self.loanBankersCount = loanBankersCount
        self.depositBankersCount = depositBankersCount
    }
    
    func handOutWaitingNumber(from customerCount: Int = 10) {
        var loanQueue = Queue<Customer>()
        var depositQueue = Queue<Customer>()
        let maxCount = numberOfCustomers + customerCount
        let waitingNumbers = numberOfCustomers..<maxCount
        for number in waitingNumbers {
            let customer = Customer(waitingNumber: number)
            separate(with: customer, &loanQueue, &depositQueue)
            delegate?.bank(didEnqueueCustomer: customer)
        }
        numberOfCustomers = maxCount
        overwrite(loanQueue, depositQueue)
    }
    
    private func separate(with customer: Customer, _ loanQueue: inout Queue<Customer>, _ depositQueue: inout Queue<Customer>) {
        switch customer.banking {
        case .loan:
            if loanCustomerQueue.isEmpty {
                loanQueue.enqueue(customer)
            } else {
                loanCustomerQueue.enqueue(customer)
            }
        case .deposit:
            if depositCustomerQueue.isEmpty {
                depositQueue.enqueue(customer)
            } else {
                depositCustomerQueue.enqueue(customer)
            }
        }
    }
    
    private func overwrite(_ loanQueue: Queue<Customer>, _ depositQueue: Queue<Customer>) {
        if loanCustomerQueue.isEmpty {
            loanCustomerQueue = loanQueue
        }
        if depositCustomerQueue.isEmpty {
            depositCustomerQueue = depositQueue
        }
    }
    
    func open() {
        let isNotWorking = timer == nil
        guard isNotWorking else {
            return
        }
        startTimer()
        
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
        banker.delegate = delegate
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
        timer = nil
        workTime = 0
        loanCustomerQueue.clear()
        depositCustomerQueue.clear()
    }
}
