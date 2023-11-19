public struct BankManager {
    public var bank: Bank

    public init(bankName: String, employeesCount: Int = 1) {
        bank = Bank(name: bankName, employeesCount: employeesCount)
    }
}
