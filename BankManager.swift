import Foundation

struct Queue<T> {
    typealias LinkedList = Array
    
    private var items: LinkedList<T>
    
    init() {
        items = LinkedList<T>.init()
    }
}
