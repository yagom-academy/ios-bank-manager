import Foundation

protocol Waitable { }

struct Customer: Waitable {
    let number: Int
    
    init(number: Int) {
        self.number = number
    }
}
