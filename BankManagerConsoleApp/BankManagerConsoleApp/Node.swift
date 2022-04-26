//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

final class Node<T> {
    var value: T
    weak var previous: Node?
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}
