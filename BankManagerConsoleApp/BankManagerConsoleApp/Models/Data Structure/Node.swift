//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/10/31.
//

final class Node<Element> {
    private var data: Element
    private var next: Node<Element>?
    
    init(data: Element, next: Node<Element>? = nil) {
        self.data = data
        self.next = next
    }
    
    var nodeData: Element {
        return data
    }
    
    var nextNode: Node<Element>? {
        return next
    }
    
    func setupNext(node: Node<Element>) {
        next = node
    }
}
