import Foundation

class Bank {
    private var delegate: BankDelegate?
    private var clientQueue: Queue<Client> = Queue<Client>()
    private var completedClientCount: Int = 0
    private let numberOfBankClerkForDeposit: Int
    private let numberOfBankClerkForLoan: Int
    
    init(
        delegate: BankDelegate,
        numberOfBankClerkForDeposit: Int,
        numberOfBankClerkForLoan: Int
    ) {
        self.delegate = delegate
        self.numberOfBankClerkForDeposit = numberOfBankClerkForDeposit
        self.numberOfBankClerkForLoan = numberOfBankClerkForLoan
        self.receiveClient()
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
    
    func open() {
        let workHours = measureTime() {
            self.allocateClientToBankClerk(
                inChargeOfDeposits: numberOfBankClerkForDeposit,
                inChargeOfLoans: numberOfBankClerkForLoan
            )
        }
        delegate?.closeBusiness(by: completedClientCount, workHours: workHours)
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
        let depositSemaphore = DispatchSemaphore(value: inChargeOfDeposits)
        let loanSemaphore = DispatchSemaphore(value: inChargeOfLoans)
        let group = DispatchGroup()
        
        while let client = self.clientQueue.dequeue() {
            DispatchQueue.global().async(group: group) {
                switch client.bankTask {
                case .deposit:
                    depositSemaphore.wait()
                    self.makeBankClerkWork(for: client)
                    depositSemaphore.signal()
                case .loan:
                    loanSemaphore.wait()
                    self.makeBankClerkWork(for: client)
                    loanSemaphore.signal()
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
