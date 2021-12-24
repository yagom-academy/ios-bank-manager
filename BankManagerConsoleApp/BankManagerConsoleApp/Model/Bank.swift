import Foundation
import CloudKit

struct Bank {
    var clientQueue: Queue<Client> = Queue<Client>()
    var bankClerks: [BankClerk] = []
    var numberOfBankClerk: Int?
    
    init(numberOfBankClerk: Int) {
        self.makeBankClerk(for: numberOfBankClerk)
        self.receiveClient()
    }
    
    func open() {
        var queue = clientQueue
        let semaphore = DispatchSemaphore(value: 1)
        for bankClerk in bankClerks {
            DispatchQueue.global().async {
                while !queue.isEmpty {
                    semaphore.wait()
                    if let client = queue.dequeue() {
                        semaphore.signal()
                        bankClerk.work(for: client)
                    }
                }
            }
        }
    }
    
    func close() {
        
    }
    
    private mutating func receiveClient() {
        let numberOfClient = Int.random(in: 10...30)
        for number in 1...numberOfClient {
            let client = Client(number: number)
            clientQueue.enqueue(client)
        }
    }
    
    private mutating func makeBankClerk(for number: Int) {
        for i in 1...number {
            let bankClerk = BankClerk(identity: i)
            bankClerks.append(bankClerk)
        }
    }
}

