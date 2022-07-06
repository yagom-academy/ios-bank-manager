final class Node<T> {
    let value: T
    var next: Node?
    
    init(_ value: T) {
        self.value = value
    }
}

extension Node: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs === rhs
    }
}
