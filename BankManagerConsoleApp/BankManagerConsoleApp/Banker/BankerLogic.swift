protocol BankerLogic {
    static var number: Int { get set }
    static func serve(customer: Customer)
}
