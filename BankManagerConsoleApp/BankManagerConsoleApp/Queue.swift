//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/06.
//

struct CustomerQueue<T> {
    private var list: LinkedList<T> = LinkedList()
    
    mutating func enqueue(_ data: T) {
        list.append(data: data)
    }
}
