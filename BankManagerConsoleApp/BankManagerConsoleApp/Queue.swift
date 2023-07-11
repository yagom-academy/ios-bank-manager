//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/10.
//

struct Queue<Element> {
    private var waitingLineLinkedList = LinkedList<Element>()
    
    var peek: Element? {
        let node = waitingLineLinkedList.head
        return node?.value
    }
    
    var isEmpty: Bool {
        return waitingLineLinkedList.head == nil
    }
    
    func enqueue(_ value: Element) {
        let node = Node(value: value)
        
        waitingLineLinkedList.append(node)
    }
    
    func dequeue() -> Element? {
        return waitingLineLinkedList.removeFirst()?.value
    }
    
    func clear() {
        waitingLineLinkedList.clear()
    }
}
