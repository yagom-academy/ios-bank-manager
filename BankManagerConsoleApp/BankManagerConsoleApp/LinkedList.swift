//
//  LinkedList.swift
//  BankManagerConsoleApp

final class Node<Element> {
    private(set) var value: Element
    private(set) var next: Node<Element>?
    
    init(value: Element, next: Node<Element>? = nil) {
        self.value = value
        self.next = next// 5.next 4
    }
    
    func changeValue(_ value: Element) {
        self.value = value
    }
    
    func changeNext(_ node: Node?) {
        self.next = node
    }
}

class LinkedList {
    
}
