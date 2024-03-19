//
//  SinglyLinkedList.swift
//
//
//  Created by Danny, Prism on 3/19/24.
//

class SinglyLinkedList<T> {
    class Node {
        var data: T
        var next: Node? = nil
        
        init(data: T) {
            self.data = data
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
    
    func enqueue() {
        
    }
    
    func dequeue() -> T? {
        return nil
    }
    
    func clear() {
        
    }
}
