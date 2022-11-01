//
//  Node.swift
//  BankManagerUIApp
//
//  Created by Mangdi, Mene on 31/10/2022.
//

import Foundation

final class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node?) {
        self.data = data
        self.next = next
    }
}
