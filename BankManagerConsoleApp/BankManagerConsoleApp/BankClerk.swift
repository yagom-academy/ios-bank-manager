
struct BankClerk {
    var totalWorkingTime: Float = 0
    var isWorking: Bool = false
    
    mutating func handleClientBusiness(client: Client) {
        isWorking = true
        
        if client.business == .basic {
            totalWorkingTime += 0.7
        } else {
            print("죄송합니다! 제가 처리할 수 없는 업무군요 ㅠ")
        }
        
        isWorking = false
    }
}
