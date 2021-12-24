import Foundation

struct BankClerk {
    func work(for client: Client) {
        print("\(client.number)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(client.number)번 고객 업무 완료")
    }
}
