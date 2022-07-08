import Foundation

struct LoanBanker: BankerLogic {
    func serve(customer: Customer) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "process"), object: customer)
        Thread.sleep(forTimeInterval: 1.1)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "finish"), object: customer)
    }
}
