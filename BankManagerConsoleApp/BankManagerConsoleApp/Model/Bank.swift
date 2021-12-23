import Foundation

struct Bank {
    var clientQueue: Queue<Client> = Queue<Client>()
    var bankClerks: [BankClerk]?
    var numberOfBankClerk: Int?
    
    init(numberOfBankClerk: Int) {
        self.makeBankClerk(for: numberOfBankClerk)
        self.receiveClient()
    }
    
    func open() {
        
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
        for _ in 1...number {
            let bankClerk = BankClerk()
            bankClerks?.append(bankClerk)
        }
    }
}
