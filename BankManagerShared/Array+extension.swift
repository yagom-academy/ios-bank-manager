import Foundation

extension Array where Element == Banker {
    mutating func append(BankerType: Banker, count: Int) {
        for _ in 0..<count {
            self.append(BankerType)
        }
    }
}
