public struct BankManager {
    private var bank: Bank
    
    public init() {
        self.bank = Bank()
    }
    
    public mutating func openBank() async throws {
        var isWorking: Bool = true
        var totalCustomer: Int = 0
        let banker = Banker(id: 1) // 아이디가 1인 은행원을 생성한다
        
        bank.addBanker(banker)
        bank.addCustomer() // 고객을 추가한다
        
        while isWorking {
            isWorking = try await bank.preceedBankWork(banker)
            totalCustomer += 1
        }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 XX초입니다.")
    }
}
