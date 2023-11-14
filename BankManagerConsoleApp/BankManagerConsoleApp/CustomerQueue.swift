//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by jyubong, Toy on 11/14/23.
//

struct CustomerQueue<Element> {
    private var list: LinkedList<Element>
    
    var peek: Element? { list.first }
    
    var isEmpty: Bool { list.isEmpty }
    
    init(list: LinkedList<Element>) {
        self.list = list
    }
    
    func enqueue(_ element: Element) {
        list.append(value: element)
    }
    
    func dequeue() -> Element? {
        return list.removeFirst()
    }
    
    func clear() {
        list.removeAll()
    }
}
