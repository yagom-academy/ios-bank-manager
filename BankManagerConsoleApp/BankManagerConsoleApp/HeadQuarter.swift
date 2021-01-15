
import Foundation

class HeadQuarter {
    static let main: HeadQuarter = HeadQuarter()
    private let loanScreeningQueue = DispatchQueue(label: "loanScreening")
    
    private init() {}
    
    func handleLoanScreeningQueue(of client: ClientOperation) throws -> Bool {
        try self.loanScreeningQueue.sync {
            print(ConsoleOutput.currentProcess(client, .startExamination).message)
            Thread.sleep(forTimeInterval: 0.5)
            
            guard let qualification = client.isQualified else {
                throw BankOperationError.unknownError
            }
            
            switch qualification {
            case true:
                print(ConsoleOutput.currentProcess(client, .completeExamination).message)
                return true
            case false:
                print("대출 심사 실패!")
                return false
            }
        }
    }
}

let headQuarter = HeadQuarter.main
