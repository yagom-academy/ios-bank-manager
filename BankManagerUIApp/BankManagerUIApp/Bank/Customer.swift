struct Customer {
    let number: Int
    let banking: Banking
    
    init (_ number: Int) {
        self.number = number
        self.banking = Banking.allCases.randomElement() ?? .deposit
    }
}
