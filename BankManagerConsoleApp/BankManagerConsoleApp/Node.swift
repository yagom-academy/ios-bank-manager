//
//  Node.swift
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
