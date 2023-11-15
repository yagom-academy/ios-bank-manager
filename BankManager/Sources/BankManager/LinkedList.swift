//
//  File.swift
//  
//
//  Created by uemu, hisop on 2023/11/13.
//

class LinkedList<T> {
    final class Node {
        var value: T
        var next: Node?
        
        init(value: T) {
            self.value = value
        }
    }
    
    var head: Node?
    var tail: Node?
    var count = 0
    
    var checkEmpty: Bool {
        head == nil
    }
    
    var elementCount: Int {
        count
    }
    
    var headValue: T? {
        head?.value
    }
    
    func addNode(value: T) {
        let node = Node(value: value)
        
        if checkEmpty {
            head = node
        } else {
            tail?.next = node
        }
        tail = node
        
        count += 1
    }
    
    func removeNode() -> T? {
        guard let node = head else {
            return nil
        }
        
        head = node.next
        if head == nil {
            tail = nil
        }
        count -= 1
        
        return node.value
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
