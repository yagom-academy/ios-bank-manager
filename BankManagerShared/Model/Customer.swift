import Foundation

struct Customer {
    var customerNumber: Int {
        get {
            return indexNumber + 1
        }
    }
    let indexNumber: Int
    let taskType: TaskType
}
