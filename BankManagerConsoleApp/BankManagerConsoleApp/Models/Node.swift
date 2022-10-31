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
    
    func bringNodeData() -> Element {
        return data
    }
    
    func bringNextNode() -> Node<Element>? {
        return next
    }
    
    func setupNextNode(node: Node<Element>) {
        next = node
    }
}
