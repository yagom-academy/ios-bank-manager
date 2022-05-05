import Foundation

struct Customer {
    let number: Int
    let bankingType: BankingTask?
    
    init(_ number: Int) {
        self.number = number
        self.bankingType = BankingTask.allCases.randomElement()
    }
}
