//
//  SinglyLinkedList.swift
//
//
//  Created by Danny, Prism on 3/19/24.
//

final class SinglyLinkedList<T> {
    final class Node {
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
        return count == 0 ? true : false
    }
    
    var first: T? {
        return isEmpty ? nil : head?.element
    }
    
    var last: T? {
        return isEmpty ? nil : tail?.element
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
        head = nil
        tail = nil
        count = 0
    }
}
