import Foundation

struct DepositBanker: BankerLogic {
    static var number = 0
    
    static func serve(customer: Customer) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "process"), object: customer)
        Thread.sleep(forTimeInterval: 0.7)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "finish"), object: customer)
    }
}
