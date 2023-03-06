//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/06.
//

import Foundation

final class Node<T> {
    var next: Node?
    let value: T
    
    init(next: Node? = nil, value: T) {
        self.next = next
        self.value = value
    }
}
