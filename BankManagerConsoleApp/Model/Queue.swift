//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 리지, 무리 on 2023/03/06.
//

struct Queue<T> {
    private var list = LinkedList<T>()
    var count: Int {
        return list.count
    }
    var isEmpty: Bool {
        return list.isEmpty
    }
    var peek: T? {
        return list.peek
    }
    
    mutating func enqueue(_ data: T) {
        list.append(data)
    }
    
    mutating func dequeue() -> T? {
        return  list.removeFirst()
    }
    
    mutating func clear() {
        list.removeAll()
    }
}
