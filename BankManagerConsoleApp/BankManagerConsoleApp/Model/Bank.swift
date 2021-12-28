import Foundation

class Bank {
    private var clientQueue: Queue<Client> = Queue<Client>()
    private var completedClientCount: Int = 0
    private var bankClerks: [BankClerk] = []
    private var numberOfBankClerk: Int?
    private let semaphore = DispatchSemaphore(value: 1)
    
    init(numberOfBankClerk: Int) {
        self.makeBankClerk(for: numberOfBankClerk)
        self.receiveClient()
    }
    
    func open() {
        let workHours = measureTime() {
            makeBankClerksWork()
        }
        close(duration: workHours)
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
    
    private func makeBankClerksWork() {
        let group = DispatchGroup()
        for bankClerk in bankClerks {
            DispatchQueue.global().async(group: group) {
                self.distributeClient(to: bankClerk)
            }
        }
        group.wait()
    }
    
    private func distributeClient(to bankClerk: BankClerk) {
        while !self.clientQueue.isEmpty {
            semaphore.wait()
            if let client = self.clientQueue.dequeue() {
                semaphore.signal()
                bankClerk.work(for: client)
                completedClientCount += 1
            }
        }
    }
    
    private func close(duration: String) {
        print(ConsoleBundle.TaskMessage.closeMessage(
            count: completedClientCount,
            duration: duration)
        )
    }
    
    private func makeBankClerk(for number: Int) {
        for _ in 1...number {
            let bankClerk = BankClerk()
            bankClerks.append(bankClerk)
        }
    }
    
    private func receiveClient() {
        let numberOfClient = Int.random(in: 10...30)
        for number in 1...numberOfClient {
            let client = Client(number: number)
            clientQueue.enqueue(client)
        }
    }
}
