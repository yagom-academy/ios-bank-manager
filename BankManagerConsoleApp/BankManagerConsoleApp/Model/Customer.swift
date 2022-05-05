import Foundation

struct Customer {
    let number: Int
    let taskType: BankingTask?
    
    init(_ number: Int) {
        self.number = number
        self.taskType = BankingTask.allCases.randomElement()
    }
}
