//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/10/31.
//

struct Queue<Element> {
    private var list: LinkedList<Element> = LinkedList()
    
    var peek: Element? {
        return list.bringHead()
    }
    
    var isEmpty: Bool {
        return list.bringListCount() == 0 ? true : false
    }
    
    mutating func enqueue(_ data: Element) {
        list.append(data: data)
    }
    
    mutating func dequeue() -> Element? {
        return list.removeFirst()
    }
    
    mutating func clear() {
        list.removeAll()
    }
}
