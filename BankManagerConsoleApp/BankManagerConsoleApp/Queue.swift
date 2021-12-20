import Foundation

struct Queue<T> {
    class Node<S> {
        var data: S
        var next: Node?
        
        init(data: S, next: Node? = nil) {
            self.next = next
            self.data = data
        }
    }
}
