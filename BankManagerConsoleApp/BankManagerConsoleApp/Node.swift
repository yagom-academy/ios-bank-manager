final class Node<T> {
    var next: Node<T>?
    var data: T

    init(data: T, next: Node<T>? = nil) {
        self.data = data
        self.next = next
    }
}
