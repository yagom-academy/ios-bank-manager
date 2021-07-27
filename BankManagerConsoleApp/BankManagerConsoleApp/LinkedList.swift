//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/07/27.
//

import Foundation

final class LinkedList<T> {
    private var head: Node<T>?
    var isEmpty: Bool {
        head == nil
    }
    
    func append(data: T) {
        if head == nil {
            head = Node(data: data, link: nil)
            return
        }
        
        var currentNode = head
        while currentNode?.link != nil {
            currentNode = currentNode?.link
        }
        currentNode?.link = Node(data: data, link: nil)
    }
    
    func removeFirst() -> Node<T>? {
        defer {
            head = head?.link
        }
        return head
    }
}





