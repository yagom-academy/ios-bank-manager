
import Foundation

struct BankClerk {
    func handleClientBusiness(of client: Client) {
        print(ConsoleOutput.currentProcess(client, .start).message)
        
        switch client.business {
        case .deposit:
            Thread.sleep(forTimeInterval: 0.7)
        case .loan:
            Thread.sleep(forTimeInterval: 0.3)
            waitForLoanPermission(of: client)
            Thread.sleep(forTimeInterval: 0.3)
        }
        
        print(ConsoleOutput.currentProcess(client, .done).message)
    }
    
    private func waitForLoanPermission(of client: Client) {
        headQuarter.handleLoanQualificationQueue(of: client)
    }
}
