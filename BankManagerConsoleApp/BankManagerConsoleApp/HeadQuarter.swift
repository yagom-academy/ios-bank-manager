
import Foundation

class HeadQuarter {
    static let main: HeadQuarter = HeadQuarter()
    private let loanScreeningQueue = DispatchQueue(label: "loanScreening")
    
    private init() {}
    
    func handleLoanScreeningQueue(of client: ClientOperation) throws -> Bool {
        try self.loanScreeningQueue.sync {
            print(ConsoleOutput.currentProcess(client, .startExamination).message)
            Thread.sleep(forTimeInterval: 0.5)
        
            let clientLoanQualification = try checkIsLoanQualified(of: client)
            return clientLoanQualification
        }
    }
    
    func checkIsLoanQualified(of client: ClientOperation) throws -> Bool {
        guard let qualification = client.isLoanQualified else {
            throw BankOperationError.unknownError
        }
        
        switch qualification {
        case true:
            print(ConsoleOutput.currentProcess(client, .completeExamination).message)
            return true
        case false:
            print(ConsoleOutput.currentProcess(client, .failExamination).message)
            return false
        }
    }
}

let headQuarter = HeadQuarter.main
