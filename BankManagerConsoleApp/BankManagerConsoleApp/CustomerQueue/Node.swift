//
//  Node.swift
//  BankManagerUIApp
//
//  Created by Yetti, Redmango on 2023/07/10.
//

final class Node<Element> {
    var data: Element?
    var next: Node<Element>?
    
    init(data: Element, next: Node<Element>? = nil) {
        self.data = data
        self.next = next
    }
}
