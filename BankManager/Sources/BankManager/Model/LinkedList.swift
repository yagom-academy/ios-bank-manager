//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by jyubong, Toy on 11/14/23.
//

final class LinkedList<NodeData> {
    private var head: Node<NodeData>?
    private var tail: Node<NodeData>?
    
    var first: NodeData? { head?.data }
    
    var isEmpty: Bool { head == nil }
    
    init(head: Node<NodeData>? = nil, tail: Node<NodeData>? = nil) {
        self.head = head
        self.tail = tail
    }
    
    func append(value: NodeData) {
        let newNode: Node = Node(data: value)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.setNext(to: newNode)
        }
        
        tail = newNode
    }
    
    func removeFirst() -> NodeData? {
        guard let headData = head?.data else { return nil }
        
        head = head?.next
        
        return headData
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
