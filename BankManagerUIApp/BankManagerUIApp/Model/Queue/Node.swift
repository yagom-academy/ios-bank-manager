//
//  Node.swift
//  BankManagerUIApp
//
//  Created by 박세웅 on 2022/05/05.
//

import Foundation

final class Node<T> {
    private(set) var data: T
    weak var prev: Node<T>?
    var next: Node<T>?

    init(_ data: T) {
        self.data = data
        prev = nil
        next = nil
    }
}
