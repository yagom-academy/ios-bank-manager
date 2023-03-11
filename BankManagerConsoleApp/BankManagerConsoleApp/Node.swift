//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/06.
//

final class Node<Element> {
    let data: Element
    var next: Node?
    
    init(_ data: Element, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
