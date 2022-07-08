protocol BankerLogic {
    var number: Int { get set }
    func serve(customer: Customer)
}
