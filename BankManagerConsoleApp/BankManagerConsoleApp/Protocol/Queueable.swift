//
//  Queueable.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

protocol Queueable {
    associatedtype Element
    
    var list: LinkedList<Element> { get set }
}

extension Queueable {
    var peek: Element? {
        return list.headData
    }
    
    var isEmpty: Bool {
        return list.currentCount == 0
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
