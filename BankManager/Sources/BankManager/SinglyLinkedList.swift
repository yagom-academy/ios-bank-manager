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
        count += 1
    }
    
    func addLast(element: T) {
        let newNode = Node(element: element)
        tail?.next = newNode
        tail = newNode
        count += 1
    }
    
    func clear() {
        
    }
}
