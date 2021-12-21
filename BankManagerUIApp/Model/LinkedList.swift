//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by Jun Bang on 2021/12/21.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}
