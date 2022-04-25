//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/25.
//

struct Queue<T> {
    private let linkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
}
