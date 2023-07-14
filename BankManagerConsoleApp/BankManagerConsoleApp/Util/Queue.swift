//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/10.
//

struct Queue<Element> {
    private var linkedList = LinkedList<Element>()
    
    var peek: Element? {
        let node = linkedList.head
        return node?.value
    }
    
    var isEmpty: Bool {
        return linkedList.head == nil
    }
    
    func enqueue(_ value: Element) {
        let node = Node(value: value)
        
        linkedList.append(node)
    }
    
    func dequeue() -> Element? {
        return linkedList.removeFirst()?.value
    }
    
    func clear() {
        linkedList.clear()
    }
}
