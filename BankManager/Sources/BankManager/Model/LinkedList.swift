//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by Kiseok on 11/13/23.
//

final class LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(data: T) {
        let newNode: Node = Node(data: data)
        if head == nil {
            head = newNode
            tail = newNode
        }
        
        tail?.next = newNode
        tail = newNode
    }
    
    @discardableResult
    func removeFirst() -> T? {
        guard isEmpty == false else {
            return nil
        }
        
        let node = head
        head = head?.next
        
        return node?.data
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
