//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/01.
//

final class LinkedList<T: Equatable> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    private(set) var count: Int = 0
    
    var isEmpty: Bool {
        return count == 0
    }
    
    func insertLast(_ value: T) {
        let newNode = Node(value)
        
        if isEmpty {
            head = newNode
            tail = newNode
        } else if count == 1 {
            tail = newNode
            head?.next = tail
        } else {
            tail?.next = newNode
            tail = newNode
        }
        
        count += 1
    }
    
    func insertFirst(_ value: T) {
        let newNode = Node(value)
        
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head = newNode
        }
        
        count += 1
    }
    
    func search(_ value: T) -> Node<T>? {
        if isEmpty {
            return nil
        }
        
        var currentNode = head
        while currentNode != nil {
            if currentNode?.value == value {
                return currentNode
            }
            currentNode = currentNode?.next
        }
        
        return nil
    }
    
    func removeFirst() -> Node<T>? {
        if isEmpty {
            return nil
        }
        let currentNode = head
        
        if count == 1 {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }
        
        count -= 1
        return currentNode
    }
    
    func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
    
    func remove(_ value: T) -> T? {
        if isEmpty {
            return nil
        }
        
        if value == head?.value {
            let node = removeFirst()
            return node?.value
        }
        
        guard let node = search(value) else {
            return nil
        }
        
        var currentNode = head
        while currentNode?.next !== node {
            currentNode = currentNode?.next
        }
        
        if tail === currentNode?.next {
            tail = currentNode
        }
        
        currentNode?.next = currentNode?.next?.next
        count -= 1
        
        return node.value
    }
}
