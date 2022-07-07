struct Customer {
    enum Banking: Int {
        case loan
        case deposit
    }
            
    let number: Int
    var banking: Banking = .deposit
    
    init (_ number: Int) {
        let randomNumber = Int.random(in: 0...1)
        if let banking = Banking(rawValue: randomNumber)  {
            self.banking = banking
        }
        
        self.number = number  
    }
}
