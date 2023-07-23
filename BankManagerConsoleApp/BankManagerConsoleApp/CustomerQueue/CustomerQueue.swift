//
//  CustomerQueue.swift
//  BankManagerUIApp
//
//  Created by Yetti, Redmango on 2023/07/11.
//

final class CustomerQueue<Element> {
    private var customerQueue: LinkedList = LinkedList<Element>()
    
    var peek: Element? {
        return customerQueue.peek
    }

    var isEmpty: Bool {
        return customerQueue.isEmpty
    }
    
    func clear() {
        customerQueue.clear()
    }
    
    func enqueue(_ newElement: Element) {
        customerQueue.addLast(newElement)
    }
    
    func dequeue() -> Element? {
        return customerQueue.popFirst()
    }
}
