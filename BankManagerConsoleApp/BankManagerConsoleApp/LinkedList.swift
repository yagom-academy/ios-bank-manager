//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 홍정아 on 2021/07/27.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(data: T) {
        self.data = data
    }
}
