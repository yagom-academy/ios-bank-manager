//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/25.
//

final class Node<Element> {
    let data: Element
    var next: Node<Element>?

    init(data: Element) {
        self.data = data
    }
}
