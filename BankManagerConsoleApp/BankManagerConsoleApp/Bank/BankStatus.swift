enum BankStatus {
    case opening
    case closed

    var menu: String {
        switch self {
        case .opening:
            return "1"
        case .closed:
            return "2"
        }
    }
}
