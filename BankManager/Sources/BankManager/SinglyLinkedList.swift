//
//  SinglyLinkedList.swift
//
//
//  Created by Danny, Prism on 3/19/24.
//

class SinglyLinkedList<T> {
    class Node {
        var element: T
        var next: Node? = nil
        
        init(element: T) {
            self.element = element
        }
        
        func setNext(node: Node) {
            self.next = node
        }
    }
    
    var head: Node? = nil
    var tail: Node? = nil
    var count: Int = 0
    
    var isEmpty: Bool {
        return true
    }
    
    var first: T? {
        return nil
    }
    
    var last: T? {
        return nil
    }
    
    func addFirst(element: T) {
        let newNode = Node(element: element)
        newNode.next = head
        head = newNode
        
        if isEmpty {
            tail = head
        }
        
        count += 1
    }
    
    func addLast(element: T) {
        let newNode = Node(element: element)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
        
        tail = newNode
        count += 1
    }
    
    func removeFirst() -> T? {
        guard !isEmpty else { return nil }
        
        let element = head?.element
        head = head?.next
        count -= 1
        
        if isEmpty {
            tail = nil
        }
        
        return element
    }
    
    func clear() {
        
    }
}
