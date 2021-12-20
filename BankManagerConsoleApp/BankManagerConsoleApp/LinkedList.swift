//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Seul Mac on 2021/12/20.
//

import Foundation

class LinkedList<Element> {
    
    var head: Node<Element>?
    var tail: Node<Element>?
    
    func enqueue(data: Element) {
        if head == nil {
            head = Node(data: data, next: nil)
            tail = head
        } else {
            tail?.next = Node(data: data, next: nil)
            tail = tail?.next
        }
    }
    
    func dequeue() throws -> Element {
        guard let currentHead = head else {
            throw LinkedListError.dequeueFail
        }
        let dequeuedData = currentHead.data
        self.head = currentHead.next
        return dequeuedData
    }

}

enum LinkedListError: LocalizedError {
    case dequeueFail
    
    var description: String {
        switch self {
        case .dequeueFail:
            return "큐가 비어있습니다."
        }
    }
}
