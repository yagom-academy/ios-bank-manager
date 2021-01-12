
import Foundation

class HeadQuarter {
    static let main: HeadQuarter = HeadQuarter()
    let loanQualificationQueue = DispatchQueue(label: "loanQualification")
    
    private init() {}
    
    func handleLoanQualificationQueue(of client: Client) {
        self.loanQualificationQueue.sync {
            print("\(client.waitingNumber)번 \(client.grade.description)고객 대출심사 시작 in \(Date.timeIntervalSinceReferenceDate)")
            Thread.sleep(forTimeInterval: 0.5)
            print("\(client.waitingNumber)번 \(client.grade.description)고객 대출심사 완료 in \(Date.timeIntervalSinceReferenceDate)")
        }
    }
}

let headQuarter = HeadQuarter.main
