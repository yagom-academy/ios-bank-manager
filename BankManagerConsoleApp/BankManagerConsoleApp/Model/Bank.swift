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
    
    func open() {
        let workHours = measureTime() {
            self.makeWork()
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
    
    private func work(for client: Client) {
        self.delegate?.startWork(for: client)
        Thread.sleep(forTimeInterval: client.bankTask.requiredTime)
        completedClientCount += 1
        self.delegate?.finishWork(for: client)
    }
    
    private func makeWork() {
        let depositSemaphore = DispatchSemaphore(value: 2)
        let loanSemaphore = DispatchSemaphore(value: 1)
        let group = DispatchGroup()
        
        while let client = self.clientQueue.dequeue() {
            DispatchQueue.global().async(group: group) {
                switch client.bankTask {
                case .deposit:
                    depositSemaphore.wait()
                    self.work(for: client)
                    depositSemaphore.signal()
                case .loan:
                    loanSemaphore.wait()
                    self.work(for: client)
                    loanSemaphore.signal()
                }
            }
        }
        group.wait()
    }
    
    private func receiveClient() {
        let numberOfClient = Int.random(in: 10...30)
        for number in 1...numberOfClient {
            let client = Client(waitingNumber: number)
            clientQueue.enqueue(client)
        }
    }
}
