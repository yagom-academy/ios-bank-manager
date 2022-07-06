import Foundation

struct LoanBanker: BankerLogic {
    static var number = 0
    
    static func serve(customer: Customer) {
        print("\(customer.number)번 고객 대출업무 시작")
        Thread.sleep(forTimeInterval: 1.1)
        print("\(customer.number)번 고객 대출업무 완료")
    }
}
