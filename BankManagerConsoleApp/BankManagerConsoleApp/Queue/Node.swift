import Foundation

final class Node<T: Waitable> {
    private(set) var data: T
    weak var prev: Node<T>?
    var next: Node<T>?
    
    init(_ data: T) {
        self.data = data
        prev = nil
        next = nil
    }
}
