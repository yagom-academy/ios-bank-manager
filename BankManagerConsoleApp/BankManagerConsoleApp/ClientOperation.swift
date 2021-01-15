import Foundation

class ClientOperation: Operation {
    private(set) var waitingNumber: Int?
    private(set) var grade: ClientGrade?
    private(set) var isLoanQualified: Bool?
    private(set) var business: BusinessType?
    
    init(waitingNumber: Int) {
        guard let randomBusinessType = BusinessType.allCases.randomElement(),
              let randomClientGrade = ClientGrade.allCases.randomElement() else {
            return
        }
        
        self.waitingNumber = waitingNumber
        self.business = randomBusinessType
        self.grade = randomClientGrade
        
        // 기획서에 대출이 가능한 조건에 대한 언급이 없어 모두 true로 초기화했습니다.
        if self.business == BusinessType.loan {
            self.isLoanQualified = true
        }
    }
    
    override func main() {
        do {
            try operateBusiness(of: self)
        } catch {
            switch error {
            case BankOperationError.unknownError:
                print(BankOperationError.unknownError.rawValue)
                break
            default:
                print(BankOperationError.unknownError.rawValue)
                break
            }
        }
    }
    
    private func operateBusiness(of client: ClientOperation) throws {
        guard let clientBusiness = client.business else {
            return
        }
        
        print(ConsoleOutput.currentProcess(client, .start).message)

        switch clientBusiness {
        case .deposit:
            handleDepositBusiness()
        case .loan:
            try handleLoanBusiness(of: client)
        }
        
        print(ConsoleOutput.currentProcess(client, .done).message)
    }
    
    private func handleDepositBusiness() {
        Thread.sleep(forTimeInterval: 0.7)
    }
    
    private func handleLoanBusiness(of client: ClientOperation) throws {
        Thread.sleep(forTimeInterval: 0.3)
        
        switch try headQuarter.handleLoanScreeningQueue(of: client) {
        case true:
            Thread.sleep(forTimeInterval: 0.3)
        case false:
            break
        }
    }
}
