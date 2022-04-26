//
//  BankWaitingQueue.swift
//  BankManagerConsoleApp
//
//  Created by Donnie, Safari on 2022/04/25.
//

import Foundation

struct BankWaitingQueue<T: Listable> {
    private let list: T
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var peek: T.Element? {
        return list.peek
    }
    
    init(_ list: T) {
        self.list = list
    }
    
    func enqueue(_ data: T.Element) {
        list.append(data)
    }
    
    @discardableResult
    func dequeue() -> T.Element? {
        return list.removeFirst()
    }
    
    func clear() {
        list.removeAll()
    }
}
