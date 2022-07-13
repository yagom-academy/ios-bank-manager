import Foundation

struct BankManager {
    static func work(customer: Customer, time: TimeInterval) {
        Thread.sleep(forTimeInterval: time)
    }
}
