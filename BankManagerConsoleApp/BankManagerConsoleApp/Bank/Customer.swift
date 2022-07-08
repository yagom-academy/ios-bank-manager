struct Customer {
    let number: Int
    var banking: Banking
    
    init (_ number: Int) {
        self.number = number
        self.banking = Banking.allCases.randomElement() ?? .deposit
    }
}
