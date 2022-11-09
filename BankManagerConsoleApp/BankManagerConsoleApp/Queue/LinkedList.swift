//
//  LinkedList.swift
//  BankManagerConsoleApp

struct LinkedList<Element> {
    private(set) var head: Node<Element>?
    private var tail: Node<Element>?
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(_ node: Node<Element>) {
        if isEmpty {
            head = node
            tail = node
        } else {
            tail?.changeNext(node)
            tail = node
        }
    }
    
    mutating func removeFirst() -> Node<Element>? {
        guard !isEmpty else {
            tail = nil
            return nil
        }
        let firstNode: Node<Element>? = head
        head = head?.next
        return firstNode
    }
    
    mutating func clear() {
        head = nil
    }
}
