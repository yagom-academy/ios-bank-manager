//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 김준건 on 2021/07/27.
//

import Foundation

final class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node?) {
        self.data = data
        self.next = next
    }
}
