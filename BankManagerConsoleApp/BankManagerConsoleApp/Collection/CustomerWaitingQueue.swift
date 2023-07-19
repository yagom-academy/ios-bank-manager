//
//  CustomerWaitingQueue.swift
//  BankManagerConsoleApp
//
//  Created by yyss99, 비모 on 2023/07/10.
//

struct CustomerWaitingQueue<Element> {
    private var list: LinkedList<Element> = LinkedList()
    
    var peek: Element? {
        return list.first
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var count: Int {
        return list.count
    }
    
    mutating func enqueue(_ newElemet: Element) {
        list.append(newElemet)
    }
    
    mutating func dequeue() -> Element? {
        return list.popFirst()
    }
    
    mutating func clear() {
        list.clear()
    }
}
