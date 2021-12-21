final class Node<T> {
    var prev: Node?
    private(set) var data: T?
    var next: Node?
    
    init(prev: Node? = nil, data: T?, next: Node? = nil) {
        self.prev = prev
        self.data = data
        self.next = next
    }
}
