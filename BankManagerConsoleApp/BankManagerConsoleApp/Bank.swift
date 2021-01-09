
import Foundation

class Bank {
    private var bankClerkNumber: Int
    private var waitingList: [Client] = []
    private var totalVistedClientsNumber: Int = 0
    
    var endingMent: String {
        return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalVistedClientsNumber)명이며, 총 업무시간은 초입니다."
    }
    
    init(employeeNumber: Int) {
        self.bankClerkNumber = employeeNumber
    }

    func updateWaitingList(of size: Int) throws {
        guard size > 0 else {
            throw BankOperationError.invalidValue
        }

        for _ in  1...size {
            self.totalVistedClientsNumber += 1
            let newClient = Client(waitingNumber: totalVistedClientsNumber, business: .deposit, grade: .VIP)
            waitingList.append(newClient)
        }
    }
    
    private func handleWaitingList(with semaphore: DispatchSemaphore) {
        let bankClerk = BankClerk()
        
        while !self.waitingList.isEmpty {
            semaphore.wait()
            guard let client = self.waitingList.first else {
                return
            }
            self.waitingList.removeFirst()
            semaphore.signal()
            
            bankClerk.handleClientBusiness(of: client)
            self.totalVistedClientsNumber += 1
        }
    }
    
    func solution() {
        let semaphore = DispatchSemaphore(value: 1)
        
        for i in 1...bankClerkNumber {
            let dispatchQueue = DispatchQueue(label: "Counter\(i)Queue", attributes: .concurrent)
            
            dispatchQueue.async {
                self.handleWaitingList(with: semaphore)
            }
        }
    }
}

