import Foundation

class Client: Operation {
    private(set) var waitingNumber: Int?
    private(set) var business: BusinessType?
    private(set) var grade: ClientGrade?
    
    init(waitingNumber: Int) {
        guard let randomBusinessType = BusinessType.allCases.randomElement(),
              let randomClientGrade = ClientGrade.allCases.randomElement() else {
            return
        }
        
        self.waitingNumber = waitingNumber
        self.business = randomBusinessType
        self.grade = randomClientGrade
    }
    
    override func main() {
        let clerk = BankClerk()
        clerk.handleClientBusiness(of: self)
    }
}
