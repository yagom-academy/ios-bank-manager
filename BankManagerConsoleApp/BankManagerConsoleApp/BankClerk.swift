
import Foundation

struct BankClerk {
    func handleClientBusiness(of client: Client) {
        print("\(client.waitingNumber)번 \(client.grade.description)고객 \(client.business.rawValue)업무 시작")
        
        switch client.business {
        case .deposit:
            Thread.sleep(forTimeInterval: 0.7)
        case .loan:
            print("\(client.waitingNumber)번 \(client.grade.description)고객 대출심사 시작")
            waitForLoanPermission()
            print("\(client.waitingNumber)번 \(client.grade.description)고객 대출심사 완료")
        }
        
        print("\(client.waitingNumber)번 \(client.grade.description)고객 \(client.business.rawValue)업무 종료")
    }
    
    private func waitForLoanPermission() {
        Thread.sleep(forTimeInterval: 0.3)
        DispatchQueue.global().sync {
            print("본사에 업무 요청, 본사에서 업무 요청 승인 후 돌아온다.")
        }
        Thread.sleep(forTimeInterval: 0.3)
    }
}

