//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/06.
//

struct CustomerQueue<T> {
    private var list: LinkedList<T> = LinkedList()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var count: Int {
        return list.count
    }
    
    mutating func enqueue(_ data: T) {
        list.append(data: data)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        guard let node = list.removeFirst() else { return nil }
        
        return node.data
    }
    
    mutating func clear() {
        list.clear()
    }
    
    func peek() -> T? {
        guard let head = list.head else { return nil }
        
        return head.data
    }
}
