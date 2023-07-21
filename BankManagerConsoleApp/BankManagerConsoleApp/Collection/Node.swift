//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by yyss99, 비모 on 2023/07/10.
//

final class Node<Element> {
    private(set) var data: Element
    var next: Node?
    
    init(data: Element, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
