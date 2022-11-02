//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/01.
//

final class Queue<T: Equatable> {
    private(set) var linkedList: LinkedList<T> = LinkedList()
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    func enqueue(_ value: T) {
        linkedList.insertLast(value)
    }
    
    func dequeue() -> T? {
        return linkedList.removeFirst()?.value
    }
    
    func clear() {
        linkedList.removeAll()
    }
    
    func peek() -> T? {
        return linkedList.head?.value
    }
}
