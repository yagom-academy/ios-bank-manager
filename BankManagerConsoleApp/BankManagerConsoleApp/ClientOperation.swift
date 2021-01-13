import Foundation

class ClientOperation: Operation {
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
        handleClientBusiness(of: self)
    }
    
    private func handleClientBusiness(of client: ClientOperation) {
        guard let clientBusiness = client.business else {
            return
        }
        
        print(ConsoleOutput.currentProcess(client, .start).message)

        switch clientBusiness {
        case .deposit:
            Thread.sleep(forTimeInterval: 0.7)
        case .loan:
            Thread.sleep(forTimeInterval: 0.3)
            waitForLoanPermission(of: client)
            Thread.sleep(forTimeInterval: 0.3)
        }
        
        print(ConsoleOutput.currentProcess(client, .done).message)
    }
    
    private func waitForLoanPermission(of client: ClientOperation) {
        headQuarter.handleLoanQualificationQueue(of: client)
    }
}
