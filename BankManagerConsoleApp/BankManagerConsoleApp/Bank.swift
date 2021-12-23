import Foundation

class Bank {
    private let clients = Queue<Client>()
    private let numberOfClients: Int
    private let semaphore: DispatchSemaphore
    
    init(numberOfClients: Int, numberOfBankTellers: Int) {
        self.numberOfClients = numberOfClients
        self.semaphore = DispatchSemaphore(value: numberOfBankTellers)
        addClientsToQueue(by: numberOfClients)
    }
    
    func startBusiness() {
        let startTime = Date()
        
        let group = DispatchGroup()
        while let client = clients.dequeue() {
            DispatchQueue.global().async(group: group) {
                self.semaphore.wait()
                self.respond(to: client)
                self.semaphore.signal()
            }
        }
        group.wait()
        
        let elapsedTime = String(format: "%.2f", Date().timeIntervalSince(startTime))
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(self.numberOfClients)명이며, 총 업무시간은 \(elapsedTime)초입니다.")
    }
    
    private func addClientsToQueue(by numberOfClients: Int) {
        (1...numberOfClients).forEach {
            let client = Client(waitingNumber: $0)
            clients.enqueue(client)
        }
    }

    private func respond(to client: Client) {
        print("\(client.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(client.waitingNumber)번 고객 업무 완료")
    }
}
