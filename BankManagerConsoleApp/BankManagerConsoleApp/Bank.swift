
import Foundation

class Bank {
    private var clerkNumber: Int
    private var waitingList: [ClientOperation] = []
    private var startTime: TimeInterval = 0
    var totalOperateTime: Double = 0
    var totalClientCount: Int {
        return waitingList.count
    }
    
    init(employeeNumber: Int) {
        self.clerkNumber = employeeNumber
    }
    
    func updateWaitingList(from queue: [ClientOperation]) throws {
        guard queue.count > 0  else {
            throw BankOperationError.unknownError
        }
        
        self.waitingList += queue
        try sortWaitingList()
    }
    
    private func sortWaitingList() throws {
        try waitingList.sort { (client1, client2) -> Bool in
            guard let client1Grade = client1.grade?.rawValue, let client2Grade = client2.grade?.rawValue else {
                throw BankOperationError.unknownError
            }
            
            return client1Grade < client2Grade
        }
    }
    
    func startWorking() {
        let clientOperationQueue = OperationQueue()
        clientOperationQueue.maxConcurrentOperationCount = clerkNumber
        clientOperationQueue.addOperations(waitingList, waitUntilFinished: true)
    }
    
    func printEndingMent() {
        print(ConsoleOutput.bankClosing(self).message)
    }
}

// MARK: Timer
extension Bank {
    func startTimer() {
        startTime = Date.timeIntervalSinceReferenceDate
    }
    
    func stopTimer() {
        let currentTime = Date.timeIntervalSinceReferenceDate
        let timeDiferrence = currentTime - startTime
        
        totalOperateTime = roundToSecondDecimalPlace(number: timeDiferrence)
    }
    
    private func roundToSecondDecimalPlace(number: Double) -> Double {
        let newNumber = number * 100
        let result = round(newNumber) / 100
        return result
    }
}
