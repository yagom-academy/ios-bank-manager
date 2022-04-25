//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by SeoDongyeon on 2022/04/25.
//

import Foundation

final class Node<T> {
    var value: T
    var next: Node?
    var previous: Node?
    
    init(value: T, next: Node? = nil, previous: Node? = nil) {
        self.value = value
        self.next = next
        self.previous = previous
    }
}

protocol Listable {
    associatedtype Element
    var isEmpty: Bool { get }
    
    func removeFirst() -> Element?
    func append()
    func removeAll()
    func peek() -> Element?
}
