import Foundation

struct BankManager { // 시간초만 반납
    static func work(during time: TimeInterval) {
        Thread.sleep(forTimeInterval: time)
    }
}
