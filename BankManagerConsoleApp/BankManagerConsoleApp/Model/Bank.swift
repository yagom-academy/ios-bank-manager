import Foundation

class Bank {
    private var clientQueue: Queue<Client> = Queue<Client>()
    private var completedClientCount: Int = 0
    private var bankClerks: [BankClerk] = []
    private var numberOfBankClerk: Int?
    private let semaphore = DispatchSemaphore(value: 1)
    var delegate: BankDelegate?
    
    init(numberOfBankClerk: Int, delegate: BankDelegate) {
        self.receiveClient()
        self.delegate = delegate
    }
    
    private func receiveClient() {
        let numberOfClient = Int.random(in: 10...30)
        for number in 1...numberOfClient {
            let client = Client(waitingNumber: number)
            clientQueue.enqueue(client)
        }
    }
    
    func open() {
        let workHours = measureTime() {
            self.distributeWork(numberOfBankClerkForDeposit: 2, numberOfBankClerkForLoan: 1)
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
    
    private func distributeWork(numberOfBankClerkForDeposit: Int, numberOfBankClerkForLoan: Int) {
        let depositSemaphore = DispatchSemaphore(value: numberOfBankClerkForDeposit)
        let loanSemaphore = DispatchSemaphore(value: numberOfBankClerkForLoan)
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
