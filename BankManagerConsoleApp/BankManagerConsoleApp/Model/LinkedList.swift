import Foundation

struct LinkedList<Element> {
    final class Node<Element> {
        var data: Element?
        var next: Node?
        
        init(data: Element?, next: Node? = nil) {
            self.data = data
            self.next = next
        }
    }
    
    private var head: Node<Element>?
    private var tail: Node<Element>?
    var isEmpty: Bool {
        return head == nil
    }
    var first: Element? {
        return head?.data
    }
    
    init() { }
    
    init(data: Element?) {
        self.head = Node(data: data, next: nil)
        self.tail = head
    }
    
    func node(at index: Int) -> Node<Element>? {
        if index == 0 {
            return self.head
        } else {
            var node = head?.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node
        }
    }
   
    mutating func insert(_ newNodeData: Element, at index: Int) {
        if index == 0 {
            let newNode = Node(data: newNodeData, next: nil)
            newNode.next = head
            head = newNode
            return
        }
        let previousNode = node(at: index - 1)
        let newNode = Node(data: newNodeData, next: nil)
        
        guard let nextNode = previousNode?.next else {
            previousNode?.next = newNode
            tail = newNode
            return
        }
        previousNode?.next = newNode
        newNode.next = nextNode
    }
    
    mutating func remove(at index: Int) -> Element? {
        if index == 0 {
            let presentNode = head
            head = head?.next
            return presentNode?.data
        }
        let previousNode = node(at: index - 1)
        let presentNode = previousNode?.next
        guard let nextNode = previousNode?.next?.next else {
            previousNode?.next = nil
            tail = previousNode
            return presentNode?.data
        }
        previousNode?.next = nextNode
        return presentNode?.data
    }
    
    mutating func append(_ data: Element) {
        let nextNode = Node(data: data, next: nil)
        if isEmpty {
            head = nextNode
            tail = head
            return
        }
        tail?.next = nextNode
        tail = nextNode
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
