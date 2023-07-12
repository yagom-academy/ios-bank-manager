//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by kyungmin, Max on 2023/07/10.
//

struct CustomerQueue<Element: Equatable>: QueueType {
    private var linkedList = LinkedList<Element>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    mutating func enqueue(_ value: Element) {
        linkedList.append(value)
    }
    
    mutating func dequeue() -> Element? {
        return linkedList.pop()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
    
    func peek() -> Element? {
        return linkedList.peek()
    }
}
