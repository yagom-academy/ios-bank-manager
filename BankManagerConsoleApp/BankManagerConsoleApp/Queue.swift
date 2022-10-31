//
//  Queue.swift
//  BankManagerConsoleApp

struct Queue<Element> {
    private var queue: LinkedList<Element>
    private var isEmpty: Bool
    
    // Enqueue, Dequeue, Clear, Peek, isEmpty
    mutating func enqueue(_ value: Element) {
        let node: Node = Node(value: value)
        queue.append(node)
    }
    
    mutating func dequeue() -> Element? {
        return queue.removeFirst()?.value
    }
    
    mutating func clear() {
        queue.clear()
    }
    
    func peek() -> Element? {
        return queue.head?.value
    }
}
