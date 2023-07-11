//
//  Node.swift
//  BankManagerUIApp
//
//  Created by Whales, Zion on 2023/07/10.
//

final class Node<Element> {
    var data: Element
    var next: Node?

    init(data: Element) {
        self.data = data
    }
}
