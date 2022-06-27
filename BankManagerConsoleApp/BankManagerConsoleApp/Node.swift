//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 김동용 on 2022/06/27.
//

import Foundation

class Node<T> {
    var next: Node<T>?
    var previous: Node<T>?
    var data: T
    
    init(data: T) {
        self.data = data
    }
}
