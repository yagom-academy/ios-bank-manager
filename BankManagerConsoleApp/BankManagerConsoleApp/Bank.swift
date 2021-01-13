
import Foundation

class Bank {
    private var clerkNumber: Int
    private var waitingList: [ClientOperation] = []
    private var totalProcessedClientsCount: Int = 0
    private var totalOperateTime: Double = 0
    private var startTime: TimeInterval = 0
    
    init(employeeNumber: Int) {
        self.clerkNumber = employeeNumber
    }
    
    func updateWaitingList(from queue: [ClientOperation]) throws {
        guard queue.count > 0  else {
            throw BankOperationError.unknownError
        }
        
        self.waitingList += queue
        
        waitingList.sort { (client1, client2) -> Bool in
            guard let client1Grade = client1.grade?.rawValue, let client2Grade = client2.grade?.rawValue else {
                throw BankOperationError.unknownError
            }
            return client1Grade < client2Grade
        }
    }
    
    func makeAllClerksWork() {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = clerkNumber
        queue.addOperations(waitingList, waitUntilFinished: true)
    }
    
    func printEndingMent() {
        let endingMent =  "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalProcessedClientsCount)명이며, 총 업무시간은 \(totalOperateTime)초입니다."
        print(endingMent)
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
