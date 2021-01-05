
struct Bank {
    var serviceCounter: [Int : BankClerk] = [:]
    var waitingList: [Client] = []
    var totalVistedClientsNumber: Int = 0
    var totalProcessedClientsNumber: Int = 0
    var totalOperatingTime: Float = 0
}
