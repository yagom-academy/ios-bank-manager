
import Foundation

class HeadQuarter {
    static let main: HeadQuarter = HeadQuarter()
    let loanQualificationQueue = DispatchQueue(label: "loanQualification")
    
    private init() {}
    
    func handleLoanQualificationQueue(of client: Client) {
        self.loanQualificationQueue.sync {
            print(ConsoleOutput.currentProcess(client, .startExamination).message)
            Thread.sleep(forTimeInterval: 0.5)
            print(ConsoleOutput.currentProcess(client, .completeExamination).message)
        }
    }
}

let headQuarter = HeadQuarter.main
