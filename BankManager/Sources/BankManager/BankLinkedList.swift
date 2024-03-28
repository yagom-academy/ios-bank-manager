//
//  BankLinkedList.swift
//  
//
//  Created by Gray, Gama on 2024/03/18.
//

public struct BankLinkedList<T> {
    private var head: BankNode<T>?
    private var tail: BankNode<T>?
    
    public var isEmpty: Bool {
        return head == nil && tail == nil
    }
    
    public var count: Int {
        var result = 0
        var node = head
        
        while node?.next != nil {
            result += 1
            node = node?.next
        }
        
        return result
    }
    
    public var first: T? {
        return isEmpty ? nil : head?.data
    }
    
    public var last: T? {
        return isEmpty ? nil : tail?.data
    }
    
    public mutating func append(element: T) {
        let node = BankNode(data: element, next: nil)
        
        if isEmpty {
            head = node
            tail = head
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    public mutating func removeFirst() -> T? {
        guard let firstNode = head?.data else {
            return nil
        }
        
        if head?.next == nil {
            head = nil
            tail = nil
            return firstNode
        }
        
        head = head?.next
        return firstNode
    }
    
    public mutating func removeAll() {
        head = nil
        tail = nil
    }
}
