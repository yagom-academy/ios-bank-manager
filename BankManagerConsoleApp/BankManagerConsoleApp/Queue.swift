//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/01.
//

final class Queue<T> {
    private(set) var linkedList: LinkedList<T> = LinkedList()
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    func enqueue(_ value: T) {
        linkedList.append(value)
    }
    
    func dequeue() -> T? {
        return linkedList.pop()?.value
    }
    
    func clear() {
        linkedList.clear()
    }
    
    func peek() -> T? {
        return linkedList.peek()
    }
}
