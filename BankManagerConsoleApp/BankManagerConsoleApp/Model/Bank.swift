import Foundation

class Bank {
    var clientQueue: Queue<Client> = Queue<Client>()
    var completedClientCount: Int = 0
    var bankClerks: [BankClerk] = []
    var numberOfBankClerk: Int?
    let semaphore = DispatchSemaphore(value: 1)
    
    init(numberOfBankClerk: Int) {
        self.makeBankClerk(for: numberOfBankClerk)
        self.receiveClient()
    }
    
    func open() {
        let group = DispatchGroup()
        let startTime = CFAbsoluteTimeGetCurrent()
        for bankClerk in bankClerks {
            DispatchQueue.global().async(group: group) {
                self.dispatchWork(bankClerk: bankClerk)
            }
        }
        group.wait()
        let finishTime = CFAbsoluteTimeGetCurrent()
        guard let duration = NumberFormatter.centisecond.string(
            for: finishTime - startTime) else {
            return
            }
        print(ConsoleBundle.TaskMessage.closeMessage(count: completedClientCount,
                                                      duration: duration))
    }
    
    private func dispatchWork(bankClerk: BankClerk) {
        while !self.clientQueue.isEmpty {
            semaphore.wait()
            if let client = self.clientQueue.dequeue() {
                semaphore.signal()
                bankClerk.work(for: client)
                completedClientCount += 1
            }
        }
    }
    
    private func receiveClient() {
        let numberOfClient = Int.random(in: 10...30)
        for number in 1...numberOfClient {
            let client = Client(number: number)
            clientQueue.enqueue(client)
        }
    }
    
    private func makeBankClerk(for number: Int) {
        for _ in 1...number {
            let bankClerk = BankClerk()
            bankClerks.append(bankClerk)
        }
    }
}
