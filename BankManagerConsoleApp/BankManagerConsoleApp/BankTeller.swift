import Foundation

struct BankTeller {
    func workFor(_ client: Client) {
        print("\(client.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(client.waitingNumber)번 고객 업무 완료")
    }
}
