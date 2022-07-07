import Foundation

struct DepositBanker: BankerLogic {
    static var number = 0
    
    static func serve(customer: Customer) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "process"), object: customer)
        Thread.sleep(forTimeInterval: 0.7)
        print("\(customer.number)번 고객 예금업무 완료")
    }
}
