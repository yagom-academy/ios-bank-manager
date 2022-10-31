//
//  LinkedList.swift
//  BankManagerConsoleApp

final class Node<Element> {
    private(set) var value: Element
    private(set) var next: Node<Element>?
    
    init(value: Element, next: Node<Element>? = nil) {
        self.value = value
        self.next = next
    }
    
    func changeValue(_ value: Element) {
        self.value = value
    }
    
    func changeNext(_ node: Node?) {
        self.next = node
    }
}

struct LinkedList<Element> {
    private(set) var head: Node<Element>?
    private var tail: Node<Element>?
    var isEmpty: Bool {
        if head == nil { return true }
        else { return false }
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
        guard !isEmpty else { return nil }
        let firstNode = head
        head = head?.next
        return firstNode
    }
}
