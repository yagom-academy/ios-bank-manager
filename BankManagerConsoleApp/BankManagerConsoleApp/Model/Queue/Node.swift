//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Zion, Whales on 2023/07/12.
//

final class Node<Element> {
    var data: Element
    var next: Node?

    init(data: Element) {
        self.data = data
    }
}
