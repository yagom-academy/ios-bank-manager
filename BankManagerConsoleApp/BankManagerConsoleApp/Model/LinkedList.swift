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
    
    func removeFirst() -> Element? {
        guard isEmpty == false else {
            return nil
        }
        let result = head?.value
        head = head?.next
        
        return result
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
