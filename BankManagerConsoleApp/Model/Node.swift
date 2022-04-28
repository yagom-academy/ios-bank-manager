//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/26.
//

import Foundation

final class Node<T> {
    private(set) var data: T
    var nextNode: Node?

    init(data: T, nextNode: Node? = nil) {
        self.data = data
        self.nextNode = nextNode
    }
}
