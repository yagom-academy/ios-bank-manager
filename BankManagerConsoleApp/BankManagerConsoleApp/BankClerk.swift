class BankClerk {
    var totalWorkingTime: Float = 0
    var isWorking: Bool = false
    
    func handleBusiness(of client: Client) {
        switch client.business {
        case .basic(let requiredTime):
            totalWorkingTime += requiredTime
        }
    }
}

