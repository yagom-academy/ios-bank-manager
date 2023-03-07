//
//  BankManagerQueue.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/06.
//

struct BankManagerQueue<T> {
    private let linkedList: LinkedList<T> = LinkedList()
    
    var peek: T? {
        linkedList.head?.value
    }
    
    var isEmpty: Bool {
        linkedList.head == nil ? true : false
    }
    
    func enqueue(_ value: T) {
        linkedList.appendLast(value: value)
    }
    
    func dequeue() -> T? {
        return linkedList.removeFirst()
    }
    
    func clear() {
        linkedList.removeAll()
    }
}
