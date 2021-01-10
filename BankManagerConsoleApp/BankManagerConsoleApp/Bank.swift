
import Foundation

class Bank {
    private var bankClerkNumber: Int
    private var waitingList: [Client] = []
    private var totalProcessedClientsNumber: Int = 0
    
    var endingMent: String {
        return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalProcessedClientsNumber)명이며, 총 업무시간은 초입니다."
    }
    
    init(employeeNumber: Int) {
        self.bankClerkNumber = employeeNumber
    }

    func updateWaitingList(to queue: [Client]) throws {
        guard queue.count > 0 else {
            throw BankOperationError.invalidValue
        }
        
        self.waitingList = queue
    }
    
    func makeAllClerksWork() {
        let semaphore = DispatchSemaphore(value: 1)
        let counterGroup = DispatchGroup()
        
        for i in 1...bankClerkNumber {
            let dispatchQueue = DispatchQueue(label: "Counter\(i)Queue", attributes: .concurrent)
        
            dispatchQueue.async(group: counterGroup) {
                self.handleWaitingList(with: semaphore)
            }
        }
        
        counterGroup.wait()
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
            self.totalProcessedClientsNumber += 1
        }
    }
}
