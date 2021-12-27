import Foundation

struct Banker {
    func task(of customer: Customer) {
        print("\(customer.customerNumber)번 고객 업무 시작")
        print("\(customer.customerNumber)번 고객 업무 완료")
    }
}
