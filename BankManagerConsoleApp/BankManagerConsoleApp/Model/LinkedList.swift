//  LinkedList.swift
//  BankManagerConsoleApp
//   Created by 쿼카, 두기 on 2022/04/26

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    private class Node<Element> {
        let newElement: Element
        var next: Node?
        
        init(newElement: Element) {
            self.newElement = newElement
        }
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Element? {
        return head?.newElement
    }
    
    mutating func append(newElement: Element) {
        let newNode = Node(newElement: newElement)
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    mutating func removeFirst() -> Element? {
        if isEmpty { return nil }
        
        let element = head?.newElement
        if head?.next == nil {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }
        return element
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}
