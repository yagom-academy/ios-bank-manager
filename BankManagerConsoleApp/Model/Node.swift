//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/26.
//

import Foundation

final class Node<T> {
    private var element: T
    private var nextNode: Node?

    init(element: T, nextNode: Node? = nil) {
        self.element = element
        self.nextNode = nextNode
    }

    func data() -> T {
        return element
    }

    func setNextNode(_ nextNode: Node) {
        self.nextNode = nextNode
    }

    func next() -> Node? {
        return nextNode
    }
}
