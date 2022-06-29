//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/06/27.
//

import Foundation

struct CustomerQueue<T> {
    private(set) var queue: LinkedList<T>
    var isEmpty: Bool {
        queue.isEmpty
    }
    var peek: T? {
        queue.peek
    }
    var count: Int {
        queue.count
    }
    
    func enqueue(data: T) {
        queue.append(data: data)
    }
    
    @discardableResult
    func dequeue() -> T? {
        queue.removeFirst()
    }
    
    func clear() {
        queue.clear()
    }
    
    init(elements: [T] = []) {
        queue = LinkedList()
        elements.forEach {
            enqueue(data: $0)
        }
    }
}
