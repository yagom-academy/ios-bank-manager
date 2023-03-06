//
//  BankQueue.swift
//  BankManagerConsoleApp
//  Created by Rhode, sehong.
//

struct BankQueue<T> {
    private var linkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    var peek: T? {
        return linkedList.peek
    }
   
    init(linkedList: LinkedList<T> = LinkedList<T>()) {
        self.linkedList = linkedList
    }
    
    mutating func enqueue(_ data: T) {
        linkedList.push(data)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.pop()
    }
    
    mutating func clear() {
        linkedList.clear()
    }
}
