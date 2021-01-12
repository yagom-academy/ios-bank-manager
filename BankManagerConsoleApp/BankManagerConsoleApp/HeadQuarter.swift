
import Foundation

class HeadQuarter {
    static let main: HeadQuarter = HeadQuarter()
    let loanQualificationQueue = DispatchQueue(label: "loanQualification")
    
    private init() {}
    
    func handleLoanQualificationQueue() {
        self.loanQualificationQueue.sync {
            Thread.sleep(forTimeInterval: 0.5)
        }
    }
}

let headQuarter = HeadQuarter.main
