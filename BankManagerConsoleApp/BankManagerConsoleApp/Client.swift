import Foundation

class Client: Operation {
    let waitingNumber: Int
    let business: BusinessType
    let grade: ClientGrade
    
    override init() {
        let randomClientNumber = Int.random(in: 10...30)
        guard let randomBusinessType = BusinessType.allCases.randomElement(),
              let randomClientGrade = ClientGrade.allCases.randomElement() else {
            return
        }
        
        self.waitingNumber = randomClientNumber
        self.business = randomBusinessType
        self.grade = randomClientGrade
    }
    
    override func main() {
        <#code#>
    }
}
