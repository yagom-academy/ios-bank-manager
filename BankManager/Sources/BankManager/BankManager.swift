import Foundation

public struct BankManager {
    private var bank: Bank
    
    public init() {
        self.bank = Bank()
    }
    
    public mutating func openBank(workTime: Double, customers: ClosedRange<Int>) async throws {
        var totalCustomer: Int = 0
        var totalTime: Double = 0
        
        bank.addCustomer(with: customers)
        
        while bank.hasWaitingCustomers() {
            let _ = try await bank.processBankWork()
            totalCustomer += 1
            totalTime += workTime
        }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(String(format: "%.2f", totalTime))초입니다.")
    }
}
