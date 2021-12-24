import Foundation

struct Customer {
    let number: Int
    let task = {
        let requiredTime = 0.7
        sleep(UInt32(requiredTime))
    }
}
