import Foundation

class Bank {
    enum Service: CaseIterable {
        case deposit
        case loan
    }
    
    private let clients = Queue<Client>()
    private let numberOfClients: Int
    private let depositSemaphore: DispatchSemaphore
    private let loanSemaphore: DispatchSemaphore
    
    init(numberOfClients: Int, numberOfDepositBankTellers: Int, numberOfLoanBankTellers: Int) {
        self.numberOfClients = numberOfClients
        self.depositSemaphore = DispatchSemaphore(value: numberOfDepositBankTellers)
        self.loanSemaphore = DispatchSemaphore(value: numberOfLoanBankTellers)
        addClientsToQueue(by: numberOfClients)
    }
    
    func startBankingService() {
        let startTime = Date()
        processAllServices()
        let elapsedTime = String(format: "%.2f", Date().timeIntervalSince(startTime))
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(self.numberOfClients)명이며, 총 업무시간은 \(elapsedTime)초입니다.")
    }
    
    private func processAllServices() {
        let depositDispatchQueue = DispatchQueue(label: "deposit")
        let loanDispatchQueue = DispatchQueue(label: "loan")
        let group = DispatchGroup()
        
        while let client = clients.dequeue() {
            switch client.business {
            case .deposit:
                depositDispatchQueue.async(group: group) {
                    self.depositSemaphore.wait()
                    self.processDepositService(to: client, group: group)
                }
            case .loan:
                loanDispatchQueue.async(group: group) {
                    self.loanSemaphore.wait()
                    self.processLoanService(to: client, group: group)
                }
            case nil:
                print("업무가 지정되지 않았습니다.")
            }
        }
        group.wait()
    }
    
    private func addClientsToQueue(by numberOfClients: Int) {
        (1...numberOfClients).forEach {
            let client = Client(waitingNumber: $0)
            clients.enqueue(client)
        }
    }

    private func processDepositService(to client: Client, group: DispatchGroup) {
        DispatchQueue.global().async(group: group) {
            print("\(client.waitingNumber)번 고객 예금업무 시작")
            Thread.sleep(forTimeInterval: 0.7)
            print("\(client.waitingNumber)번 고객 예금업무 완료")
            self.depositSemaphore.signal()
        }
    }
    
    private func processLoanService(to client: Client, group: DispatchGroup) {
        DispatchQueue.global().async(group: group) {
            print("\(client.waitingNumber)번 고객 대출업무 시작")
            Thread.sleep(forTimeInterval: 1.1)
            print("\(client.waitingNumber)번 고객 대출업무 완료")
            self.loanSemaphore.signal()
        }
    }
}
