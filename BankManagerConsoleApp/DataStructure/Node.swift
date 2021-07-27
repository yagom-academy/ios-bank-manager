//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 박태현 on 2021/07/26.
//

import Foundation

class Node<Type> {
    let value: Type
    var next: Node?
    
    init(value: Type, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        return String(describing: value)
    }
}

extension Node: Equatable {
    static func == (lhs: Node<Type>, rhs: Node<Type>) -> Bool {
        return lhs.next === rhs.next
    }
    
    static func != (lhs: Node<Type>, rhs: Node<Type>) -> Bool {
        return lhs.next !== rhs.next
    }
}
