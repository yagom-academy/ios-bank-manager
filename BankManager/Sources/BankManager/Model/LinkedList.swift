//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by Kiseok on 11/13/23.
//

public final class LinkedList<T> {
    public private(set) var head: Node<T>?
    public private(set) var tail: Node<T>?
    public private(set) var count: Int = 0
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public func append(data: T) {
        let newNode: Node = Node(data: data)
        if head == nil {
            head = newNode
            tail = newNode
        }
        
        tail?.next = newNode
        tail = newNode
        count += 1
    }
    
    @discardableResult
    public func removeFirst() -> T? {
        guard isEmpty == false else {
            return nil
        }
        
        let node = head
        head = head?.next
        count -= 1
        
        return node?.data
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
}
