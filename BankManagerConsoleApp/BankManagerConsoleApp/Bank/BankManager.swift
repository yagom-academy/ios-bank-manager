import Foundation

struct BankManager {
    static func work(customer: Customer, time: TimeInterval) {
        print(customer.name)
        Thread.sleep(forTimeInterval: time)
    }
}
