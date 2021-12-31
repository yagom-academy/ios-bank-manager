import Foundation

class Bank {
    enum Service: String, CaseIterable, CustomStringConvertible {
        case deposit
        case loan
        
        var processingTime: Double {
            switch self {
            case .deposit:
                return 0.7
            case .loan:
                return 1.1
            }
        }
        
        var description: String {
            switch self {
            case .deposit:
                return "예금"
            case .loan:
                return "대출"
            }
        }
    }
    
    weak var delegate: BankDelegate?
    private let clients = Queue<Client>()
    private var numberOfClients: Int
    private let depositSemaphore: DispatchSemaphore
    private let loanSemaphore: DispatchSemaphore
    
    private let depositDispatchQueue = DispatchQueue(label: Service.deposit.rawValue)
    private let loanDispatchQueue = DispatchQueue(label: Service.loan.rawValue)
    private let group = DispatchGroup()
    private var isProcessing = false
    
    private var serviceTime = 0.0
    private var timer: Timer?
    
    init(numberOfClients: Int, numberOfDepositBankTellers: Int, numberOfLoanBankTellers: Int) {
        self.numberOfClients = numberOfClients
        self.depositSemaphore = DispatchSemaphore(value: numberOfDepositBankTellers)
        self.loanSemaphore = DispatchSemaphore(value: numberOfLoanBankTellers)
    }
    
    convenience init() {
        self.init(numberOfClients: 0, numberOfDepositBankTellers: 2, numberOfLoanBankTellers: 1)
    }
    
    func startBankingService() {
        guard isProcessing == false else {
            processAllServices()
            return
        }
        
        isProcessing = true
        timer = Timer(timeInterval: 0.001, repeats: true) { _ in
            self.serviceTime += 0.001
            self.delegate?.updateServiceTimeLabel(serviceTime: self.serviceTime)
        }
        guard let timer = timer else {
            return
        }

        RunLoop.current.add(timer, forMode: .common)

        processAllServices()
        group.notify(queue: DispatchQueue.global()) {
            self.isProcessing = false
            self.timer?.invalidate()
        }
    }
    
    private func processAllServices() {
        while let client = clients.dequeue() {
            switch client.business {
            case .deposit:
                depositDispatchQueue.async(group: group) {
                    self.depositSemaphore.wait()
                    DispatchQueue.main.sync {
                        self.delegate?.addProcessingClient(client: client)
                        self.delegate?.removeWaitingClient(client: client)
                    }
                    self.processDepositService(to: client, group: self.group)
                }
            case .loan:
                loanDispatchQueue.async(group: group) {
                    self.loanSemaphore.wait()
                    DispatchQueue.main.sync {
                        self.delegate?.addProcessingClient(client: client)
                        self.delegate?.removeWaitingClient(client: client)
                    }
                    self.processLoanService(to: client, group: self.group)
                }
            }
        }
    }
    
    func addClientsToQueue(by numberOfClients: Int) {
        (1...numberOfClients).forEach {
            let client = Client(waitingNumber: self.numberOfClients + $0)
            clients.enqueue(client)
            delegate?.addWaitingClient(client: client)
        }
        self.numberOfClients += numberOfClients
    }

    private func processDepositService(to client: Client, group: DispatchGroup) {
        DispatchQueue.global().async(group: group) {
            Thread.sleep(forTimeInterval: Service.deposit.processingTime)
            DispatchQueue.main.sync {
                self.delegate?.removeProcessingClient(client: client)
            }
            self.depositSemaphore.signal()
        }
    }
    
    private func processLoanService(to client: Client, group: DispatchGroup) {
        DispatchQueue.global().async(group: group) {
            Thread.sleep(forTimeInterval: Service.loan.processingTime)
            DispatchQueue.main.sync {
                self.delegate?.removeProcessingClient(client: client)
            }
            self.loanSemaphore.signal()
        }
    }
    
    func initializeTimer() {
        timer?.invalidate()
    }
}
