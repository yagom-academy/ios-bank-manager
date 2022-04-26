//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 조민호 on 2022/04/25.
//

final public class LinkedList<Element> {
    final private class Node {
        var element: Element
        var next: Node?

        init(element: Element) {
            self.element = element
        }
    }
    
    private var head: Node?
    private var tail: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Element? {
        return head?.element
    }
    
    func append(_ element: Element) {
        let newNode = Node(element: element)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
        
        tail = newNode
    }
    
    func removeFirst() -> Element? {
        guard isEmpty == false else {
            return nil
        }
        
        let removedNode = head
        head = removedNode?.next
        return removedNode?.element
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
