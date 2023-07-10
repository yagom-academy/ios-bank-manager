//
//  LinkedListQueue.swift
//  BankManagerUIApp
//
//  Created by mint, Jusbug on 2023/07/10.
//

final class LinkedListQueue<T: Equatable> {
    private var head: Node<T>?
    private var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    var count: Int {
        var current = head
        var count = 0

        while current != nil {
            count += 1
            current = current?.next
        }

        return count
    }
}
