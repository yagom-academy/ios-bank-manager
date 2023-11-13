//
//  File.swift
//  
//
//  Created by uemu, hisop on 2023/11/13.
//

final public class LinkedList<T> {
    final private class Node {
        var value: T
        var next: Node?
        
        init(value: T) {
            self.value = value
        }
    }
    
    private var head: Node?
    private var tail: Node?
    private var count = 0
    
    var checkEmpty: Bool { return head == nil }
    
    var elementCount: Int { return count }
    
    var headValue: T? { return head?.value }
    
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
