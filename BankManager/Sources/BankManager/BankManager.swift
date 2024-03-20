public struct BankManager<Element> {
    public private(set) var text = "Hello, World!"

    public var queue = Queue<Element>()
    
    public init() {
    }
}
