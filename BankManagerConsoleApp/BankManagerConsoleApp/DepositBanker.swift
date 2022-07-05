import Foundation

struct DepositBanker: BankerLogic {
    func serve(customer: Customer) {
        print("\(customer.number)번 고객 예금업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(customer.number)번 고객 예금업무 완료")
    }
}
