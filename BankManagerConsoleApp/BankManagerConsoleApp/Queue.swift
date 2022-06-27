//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by bonf, judy on 2022/06/27.
//

class Queue<T> {
    private var list = LinkedList<T>()
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public var peek: T? {
        return list.firstNode?.value
    }
    
    public func enqueue(_ element: T) {
        list.append(element)
    }
    
    public func dequeue() -> T? {
        return isEmpty ? nil : list.removeHead()?.value
    }
    
    public func clear() {
        list.removeAll()
    }
}

