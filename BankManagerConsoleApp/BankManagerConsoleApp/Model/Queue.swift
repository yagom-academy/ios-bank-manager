//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 쿼카, 두기 on 2022/04/26.
//

struct Queue<Element> {
    private var elements = LinkedList<Element>()
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: Element? {
        return elements.first
    }
    
    func enqueue(data: Element) {
        elements.append(data: data)
    }

    func dequeue() {
        elements.removeFirst()
    }
    
    func clear() {
        elements.clear()
    }
}
