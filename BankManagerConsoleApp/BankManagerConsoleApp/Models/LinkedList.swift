//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/10/31.
//

final class LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    private var count: Int = 0
    
    func bringHead() -> Element? {
        let head = head
        return head?.bringNodeData()
    }
    
    func append(data: Element) {
        let node: Node<Element> = Node(data: data)
        if count == 0 {
            head = node
        } else {
            tail?.setupNextNode(node: node)
        }
        
        tail = node
        count += 1
    }
    
    func removeFirst() -> Element? {
        let removeItem = head
        head = head?.bringNextNode()
        count -= 1
        return removeItem?.bringNodeData()
    }
    
    func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
    
    func bringListCount() -> Int {
        return count
    }
}
