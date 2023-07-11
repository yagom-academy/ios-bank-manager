//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by hoon, minsup on 2023/07/10.
//

struct LinkedList<Value> {
    private var head: Node<Value>?
    private var tail: Node<Value>?
    
    var first: Value? {
        return head?.value
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(_ value: Value) {
        let newNode = Node(value)
        
        guard head != nil else {
            head = newNode
            tail = head
            return
        }
        
        tail?.next = newNode
        tail = tail?.next
    }
    
    mutating func removeFirst() -> Value? {
        guard head != nil else {
            return nil
        }
        
        let value = head?.value
        head = head?.next
        
        if head == nil {
            tail = nil
        }
        
        return value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}

//MARK: - Extension for Unit Test
#if canImport(XCTest)
extension LinkedList {
    var exposedHead: Node<Value>? {
        return head
    }
    
    var exposedTail: Node<Value>? {
        return tail
    }
    
    var count: Int {
        var currentCount = 0
        var copiedHead = head
        
        while copiedHead != nil {
            currentCount += 1
            copiedHead = copiedHead?.next
        }
        
        return currentCount
    }
    
    var elements: [Value] {
        var currentElements = [Value]()
        var copiedHead = head
        
        while copiedHead != nil {
            if let unwrappedValue = copiedHead?.value {
                currentElements.append(unwrappedValue)
            }
            
            copiedHead = copiedHead?.next
        }
        
        return currentElements
    }
}
#endif
