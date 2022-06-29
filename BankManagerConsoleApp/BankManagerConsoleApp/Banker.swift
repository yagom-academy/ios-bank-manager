import Foundation
struct Banker {
    func serve(customer: Customer) {
        print("\(customer.number)번 고객 업무 시작")
        usleep(useconds_t(700000))
        print("\(customer.number)번 고객 업무 완료")
    }
}
