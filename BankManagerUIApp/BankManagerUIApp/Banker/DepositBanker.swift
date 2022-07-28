import Foundation

struct DepositBanker: BankerLogic {
    func serve(customer: Customer) {
        NotificationCenter.default.post(name: BankManagerNotificationName.serviceDidBegin, object: customer)
        Thread.sleep(forTimeInterval: 0.7)
        NotificationCenter.default.post(name: BankManagerNotificationName.serviceDidEnd, object: customer)
    }
}
