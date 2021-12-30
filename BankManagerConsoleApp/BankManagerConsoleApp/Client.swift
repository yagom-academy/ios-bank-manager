struct Client {    
    let waitingNumber: Int
    let business = Bank.Service.allCases.randomElement() ?? .deposit
}
