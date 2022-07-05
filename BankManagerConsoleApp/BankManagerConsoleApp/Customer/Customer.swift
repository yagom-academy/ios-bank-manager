struct Customer {
    private(set) var name: String
    private(set) var business: BankBusiness

    init(name: String) {
        let businessArray = [BankBusiness.loan, BankBusiness.deposit]
        self.business = businessArray.randomElement() ?? .deposit
        self.name = name
    }
}
