import Foundation

final class LinkedList<Element> {
    final class Node<Element> {
        private(set) var value: Element
        fileprivate var next: Node<Element>?
        
        init(value: Element) {
            self.value = value
        }
    }
    
    private var head: Node<Element>?
    private var tail: Node<Element>?
    private let serialQueue = DispatchQueue(label: "LinkedListDispatchQueue")
    
    var first: Element? {
        return head?.value
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(_ value: Element) {
        let newNode = Node(value: value)
        
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    @discardableResult
    func removeFirst() -> Element? {
        var result: Element?
        serialQueue.sync {
            guard isEmpty == false else {
                return
            }
            result = head?.value
            head = head?.next
        }
        return result
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
