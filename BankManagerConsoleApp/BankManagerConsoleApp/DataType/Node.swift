final class Node<T> {
    var next: Node<T>?
    var data: T
    var previous: Node<T>?

    init(data: T, next: Node<T>? = nil, previous: Node<T>? = nil) {
        self.data = data
        self.next = next
        self.previous = previous
    }
}
