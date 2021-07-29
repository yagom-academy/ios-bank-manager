//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Jost, Hosinging on 2021/07/27.
//

import Foundation

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}
