import Foundation

struct LoanBanker: BankerLogic {
    func serve(customer: Customer) {
        NotificationCenter.default.post(name: BankManagerNotificationName.serviceDidBegin, object: customer)
        Thread.sleep(forTimeInterval: 1.1)
        NotificationCenter.default.post(name: BankManagerNotificationName.serviceDidEnd, object: customer)
    }
}
