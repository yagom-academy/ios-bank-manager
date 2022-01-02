import Foundation

class Bank {
    private var delegate: BankDelegate?
    private var clientQueue: Queue<Client> = Queue<Client>()
    private var completedClientCount: Int = 0
    private let numberOfBankClerkForDeposit: Int
    private let numberOfBankClerkForLoan: Int
    private var isOpen: Bool = false
    private var totalNumberOfClient: Int = 0
    private let depositSemaphore = DispatchSemaphore(value: 2)
    private let loanSemaphore = DispatchSemaphore(value: 1)
    
    init(
        delegate: BankDelegate,
        numberOfBankClerkForDeposit: Int,
        numberOfBankClerkForLoan: Int
    ) {
        self.delegate = delegate
        self.numberOfBankClerkForDeposit = numberOfBankClerkForDeposit
        self.numberOfBankClerkForLoan = numberOfBankClerkForLoan
    }
    
    private func receiveClient() {
        let numberOfClient = Int.random(in: 10...30)
        for number in 1...numberOfClient {
            guard let bankTask = BankTask.allCases.randomElement() else {
                return
            }
            let client = Client(waitingNumber: number, bankTask: bankTask)
            clientQueue.enqueue(client)
        }
    }
    
    private func receiveClient(of number: Int) {
        for number in 1...number {
            guard let bankTask = BankTask.allCases.randomElement() else {
                return
            }
            let client = Client(waitingNumber: number + totalNumberOfClient, bankTask: bankTask)
            clientQueue.enqueue(client)
            self.delegate?.lineUp(client: client)
        }
        totalNumberOfClient += number
    }
    
    func open() {
        isOpen = true
        self.receiveClient()
        let workHours = measureTime() {
            self.allocateClientToBankClerk(
                inChargeOfDeposits: numberOfBankClerkForDeposit,
                inChargeOfLoans: numberOfBankClerkForLoan
            )
        }
        delegate?.closeBusiness(by: completedClientCount, workHours: workHours)
        isOpen = false
    }
    
    func openForUI() {
        receiveClient(of: 10)
        DispatchQueue.global().async {
                self.allocateClientToBankClerk(inChargeOfDeposits: 2, inChargeOfLoans: 1)
            if self.totalNumberOfClient == self.completedClientCount {
                self.delegate?.closeBusiness(by: self.completedClientCount, workHours: "1")
            }
        }
    }
    
    private func measureTime(task: () -> Void) -> String {
        let startTime = Date()
        task()
        let totalTime = Date().timeIntervalSince(startTime)
        guard let duration = NumberFormatter.centisecond.string(for: totalTime) else {
            return ""
        }
        return duration
    }

    private func allocateClientToBankClerk(inChargeOfDeposits: Int, inChargeOfLoans: Int) {
        let group = DispatchGroup()
        
        while let client = self.clientQueue.dequeue() {
            DispatchQueue.global().async(group: group) {
                switch client.bankTask {
                case .deposit:
                    self.depositSemaphore.wait()
                    self.makeBankClerkWork(for: client)
                    self.depositSemaphore.signal()
                case .loan:
                    self.loanSemaphore.wait()
                    self.makeBankClerkWork(for: client)
                    self.loanSemaphore.signal()
                }
            }
        }
        group.wait()
    }
    
    private func makeBankClerkWork(for client: Client) {
        self.delegate?.startWork(for: client)
        Thread.sleep(forTimeInterval: client.bankTask.requiredTime)
        completedClientCount += 1
        self.delegate?.finishWork(for: client)
    }
}
