struct Customer {
    let number: Int
    var banking: Banking {
        let randomNumber = Int.random(in: 0...1)
        guard let banking = Banking(rawValue: randomNumber) else {
            return .deposit
        }
        return banking
    }
    
    init (_ number: Int) {
        self.number = number
    }
}
