//
//  CustomerQueue.swift
//  BankManagerUIApp
//
//  Created by Yetti, Redmango on 2023/07/11.
//

struct CustomerQueue<Element> {
    var customerQueue: LinkedList = LinkedList<Element>()
    
    var peek: Element? {
        return customerQueue.peek
    }

    var isEmpty: Bool {
        return customerQueue.isEmpty
    }
    
    mutating func clear() {
        customerQueue.clear()
    }
    
    mutating func enqueue(_ newElement: Element) {
        customerQueue.addLast(newElement)
    }
    
    mutating func dequeue() -> Element? {
        return customerQueue.popFirst()
    }
}
