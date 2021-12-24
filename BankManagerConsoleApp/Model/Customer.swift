import Foundation

struct Customer {
    let number: Int
    let task = {
        let requiredTime = 0.7
        Thread.sleep(forTimeInterval: requiredTime)
    }
}
