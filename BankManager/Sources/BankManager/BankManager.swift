public struct BankManager {
    //public private(set) var text = "Hello, World!"
    
    private var bank: Bank
    
    public init() {
        self.bank = Bank()
    }
    
    public mutating func openBank() async throws {
        let banker = Banker(id: 1) // 아이디가 1인 은행원을 생성한다
        bank.addBanker(banker)
        bank.addCustomer() // 고객을 추가한다
        try await bank.processWorkforOneBanker(banker) // 은행원이 고객의 업무를 처리한다.
    }
}
