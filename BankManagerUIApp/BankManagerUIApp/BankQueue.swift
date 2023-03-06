//
//  BankQueue.swift
//  BankManagerUIApp
//
//  Created by Goat, Andrew on 2023/03/06.
//

import Foundation

struct BankQueue<T> {
    final class Node<T> {
        private var data: T?
        private var next: Node?
        
        init(data: T?, next: Node? = nil) {
            self.data = data
            self.next = next
        }
    }
    private var head: Node<T>?
}
