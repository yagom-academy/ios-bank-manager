//
//  BankManagerQueue.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/06.
//

final class BankManagerQueue<T> {
    private let linkedList: LinkedList<T>
    
    var peek: T? {
        linkedList.head?.value
    }
    
    var isEmpty: Bool {
        linkedList.head == nil ? true : false
    }
    
    init(linkedList: LinkedList<T>) {
        self.linkedList = linkedList
    }
    
    func enqueue(_ value: T) {
        linkedList.appendLast(value: value)
    }
    
    func dequeue() -> T? {
        return linkedList.removeFirst()
    }
}
