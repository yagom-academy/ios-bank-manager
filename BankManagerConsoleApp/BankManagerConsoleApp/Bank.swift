
import Foundation

class Bank {
    private var clerkNumber: Int
    private var waitingList: [Client] = []
    private var totalProcessedClientsCount: Int = 0
    private var totalOperateTime: Double = 0
    private var startTime: TimeInterval = 0
    
    init(employeeNumber: Int) {
        self.clerkNumber = employeeNumber
    }
    
    func updateWaitingList(from queue: [Client]) throws {
        guard queue.count > 0 else {
            throw BankOperationError.unknownError
        }
        
        self.waitingList += queue
        
        waitingList.sort { (client1, client2) -> Bool in
            client1.grade.rawValue < client2.grade.rawValue
        }
    }
    
    func makeAllClerksWork() {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 3
        queue.addOperations(waitingList, waitUntilFinished: true)
        
//        let semaphore = DispatchSemaphore(value: 1)
//        let counterGroup = DispatchGroup()
//
//        for i in 1...clerkNumber {
//            let dispatchQueue = DispatchQueue(label: "Counter\(i)Queue")
//
//            dispatchQueue.async(group: counterGroup) {
//                self.handleWaitingList(with: semaphore)
//            }
//        }
//
//        counterGroup.wait()
    }
    
//    private func handleWaitingList() {
//        let bankClerk = BankClerk()
//
//        while !self.waitingList.isEmpty {
//            guard let client = self.waitingList.first else {
//                return
//            }
//            self.waitingList.removeFirst()
//
//            bankClerk.handleClientBusiness(of: client)
//            self.totalProcessedClientsCount += 1
//        }
//        
//    }
    
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
