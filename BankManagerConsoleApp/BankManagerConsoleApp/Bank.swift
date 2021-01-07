
import Foundation

class Bank {
    private var serviceCounter: [Int : BankClerk] = [ : ]
    private var waitingList: [Client] = []
    private var totalVistedClientsNumber: Int = 0

    var endingMent: String {
        return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(calculateTotalProcessedClientsNumber())명이며, 총 업무시간은 \(calculateTotalOperatingTime())초입니다."
    }
    
    init(employeeNumber: Int) throws {
        self.serviceCounter = try loadBankClerks(of: employeeNumber)
        NotificationCenter.default.addObserver(self, selector: #selector(assignClient), name: NSNotification.Name("workable"), object: nil)
    }
    
    private func loadBankClerks(of number: Int) throws -> [Int : BankClerk] {
        guard number > 0 else {
            throw BankOperationError.invalidValue
        }
        
        for counterNumber in 1 ... number {
            let newBankClerk = BankClerk(counterNumber: counterNumber)
            self.serviceCounter[counterNumber] = newBankClerk
        }
        return self.serviceCounter
    }
    
    func updateWaitingList(of size: Int) throws {
        guard size > 0 else {
            throw BankOperationError.invalidValue
        }

        for _ in  1...size {
            self.totalVistedClientsNumber += 1
            let newClient = Client(waitingNumber: totalVistedClientsNumber, business: .basic)
            waitingList.append(newClient)
        }
    }
    
    func makeAllClerksWorkable() {
        for clerk in serviceCounter.values {
            clerk.workingStatus = .workable
        }
    }
    
    @objc private func assignClient(_ noti: Notification) {
        guard let client = waitingList.first, let counterNumber = noti.userInfo?["counterNumber"] as? Int else {
            return
        }
        
        waitingList.removeFirst()
        
        guard let workableBankClerk = serviceCounter[counterNumber] else {
            return
        }
        
        workableBankClerk.handleClientBusiness(of: client)
    }
}

// MARK : bank endingment
extension Bank {
    private func calculateTotalOperatingTime() -> Float {
        let longestWorkingTime = serviceCounter.map { (key: Int, value: BankClerk) -> Float in
            return value.totalWorkingTime
        }.max() ?? 0
    
        let roundedNumber = round(longestWorkingTime * 100) / 100
        return roundedNumber
    }
    
    private func calculateTotalProcessedClientsNumber() -> Int {
        let totalProcessedClientsNumber = serviceCounter.map { (key: Int, value: BankClerk) -> Int  in
            return value.totalProcessedClients
        }.reduce(0) { (result, currentNumber) -> Int in
            return result + currentNumber
        }
        
        return totalProcessedClientsNumber
    }
}
