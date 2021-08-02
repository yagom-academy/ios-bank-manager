//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 잼킹 on 2021/07/28.
//

import Foundation

final class LinkedList<T> {
    private final class Node<T> {
        var data: T
        var next: Node?
        
        init(data: T) {
            self.data = data
            self.next = nil
        }
    }
    
    private var head: Node<T>?
    private weak var tail: Node<T>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    var first: T? {
        head?.data
    }
    
    func addLast(data: T) {
        if isEmpty {
            head = Node(data: data)
            tail = head
            return
        }
        tail?.next = Node(data: data)
        tail = tail?.next
    }
    
    @discardableResult func removeFirst() -> T? {
        if isEmpty {
            return nil
        }
        let value = head?.data
        head = head?.next
        return value
    }
    
    func removeAll() {
        head = nil
    }
}
