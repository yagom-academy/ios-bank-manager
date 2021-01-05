
struct Bank {
    var operatingCounter: [BankClerk]
    // Dictionary?
    var waitingList: [Client]
    var totalClientsProcessedNumber: Int
    var totalOperatingTime: Float
    
    // 마지막 번호표를 기억하는 프로퍼티가 필요하지 않을까?
    
    func assignCounter() {
        
    }
    
    func closeWork() {
        
    }
}
