
struct BankClerk {
    var totalWorkingTime: Float = 0
    var isWorking: Bool = false
    
    mutating func handleClientBusiness(client: Client) {
        switchStatus(waitingNumber: client.waitingNumber)
        
        if client.business == .basic {
            totalWorkingTime += 0.7
        } else {
            print("죄송합니다! 제가 처리할 수 없는 업무군요 ㅠ")
        }
        
        switchStatus(waitingNumber: client.waitingNumber)
    }
    
    private mutating func switchStatus(waitingNumber: Int) {
        switch isWorking {
        case true:
            print("\(waitingNumber)번 고객 업무 완료")
            isWorking = false
        case false:
            print("\(waitingNumber)번 고객 업무 시작")
            isWorking = true
        }
    }
}
