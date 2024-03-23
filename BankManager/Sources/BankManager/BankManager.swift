public struct BankManager {
    private var bank: Bank
    
    public init() {
        self.bank = Bank()
    }
    
    public mutating func openBank(workTime: Double) async throws {
        var isWorking: Bool = true
        var totalCustomer: Int = 0
        var totalTime: Double = 0
        
        bank.addCustomer() // 고객을 추가한다
        
        while isWorking {
            isWorking = try await bank.preceedBankWork()
            totalCustomer += 1
            totalTime += workTime
        }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(totalTime)초입니다.")
    }
}
