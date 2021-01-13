
import Foundation

class HeadQuarter {
    static let main: HeadQuarter = HeadQuarter()
    private let loanScreeningQueue = DispatchQueue(label: "loanScreening")
    
    private init() {}
    
    func handleLoanScreeningQueue(of client: ClientOperation) {
        self.loanScreeningQueue.sync {
            print(ConsoleOutput.currentProcess(client, .startExamination).message)
            Thread.sleep(forTimeInterval: 0.5)
            print(ConsoleOutput.currentProcess(client, .completeExamination).message)
        }
    }
}

let headQuarter = HeadQuarter.main
