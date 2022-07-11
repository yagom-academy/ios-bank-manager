//
//  ClientQueue.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/28.
//

struct ClientQueue<T> {
    private var linkedList = LinkedList<T>()
    var peek: T? {
        return linkedList.peek
    }
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    mutating func enqueue(_ data: T) {
        linkedList.append(data: data)
    }
    
    mutating func dequeue() -> T? {
        linkedList.pop()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
}
