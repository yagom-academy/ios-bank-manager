//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/06/27.
//

import Foundation

struct CustomerQueue<T> {
    var queue: LinkedList<T>
    var isEmpty: Bool {
        return queue.isEmpty
    }
    var peek: T? {
        return queue.peek
    }
    
    func enqueue(data: T) {
        queue.append(data: data)
    }
    
    @discardableResult
    func dequeue() -> T? {
        return queue.removeFirst()
    }
    
    func clear() {
        queue.clear()
    }
}
