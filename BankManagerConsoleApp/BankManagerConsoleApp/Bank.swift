struct Bank {
    private var clients = Queue<Client>()
    private let bankTellers: [BankTeller]
    
    mutating func admit(numberOfClients: Int) {
        (1...numberOfClients).forEach {
            let client = Client(waitingNumber: $0)
            clients.enqueue(client)
        }
    }
}
