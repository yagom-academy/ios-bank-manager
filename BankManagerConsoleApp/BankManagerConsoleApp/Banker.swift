import Foundation

struct Banker: BankerLogic {
    func serve(customer: Customer) {
        print("\(customer.number)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(customer.number)번 고객 업무 완료")
    }
}
