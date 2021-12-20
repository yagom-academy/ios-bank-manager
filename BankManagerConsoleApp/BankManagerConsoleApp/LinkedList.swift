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
    
    func append(data: Element) {
        if head == nil {
            head = Node(data: data, next: nil)
            tail = head
        } else {
            tail?.next = Node(data: data, next: nil)
            tail = tail?.next
        }
    }
    
    func removeFirst() throws -> Element {
        guard let currentHead = head else {
            throw LinkedListError.dataDoesNotExist
        }
        let firstData = currentHead.data
        self.head = currentHead.next
        return firstData
    }

}

enum LinkedListError: LocalizedError {
    case dataDoesNotExist
    
    var description: String {
        switch self {
        case .dataDoesNotExist:
            return "데이터가 존재하지 않습니다."
        }
    }
}
