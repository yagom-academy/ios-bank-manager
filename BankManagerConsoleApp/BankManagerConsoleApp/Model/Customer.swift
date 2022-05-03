import Foundation

struct Customer {
    let number: Int
    let taskType: TaskType?
    
    init(_ number: Int) {
        self.number = number
        self.taskType = TaskType.allCases.randomElement()
    }
}
