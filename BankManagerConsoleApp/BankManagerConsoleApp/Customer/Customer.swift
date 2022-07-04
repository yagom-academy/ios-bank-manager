struct Customer {
    private(set) var name: String
    private(set) var business: String

    init(name: String) {
        let businessArray = ["대출업무", "예금업무"]
        self.business = businessArray.randomElement() ?? ""
        self.name = name
    }
}
