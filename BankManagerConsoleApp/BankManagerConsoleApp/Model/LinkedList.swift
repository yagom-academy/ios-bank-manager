//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/06/27.
//

final class LinkedList<T> {
    private var head: Node<T>?
    var isEmpty: Bool {
        head == nil
    }
    var peek: T? {
        head?.data
    }
    var count: Int {
        if head == nil {
            return 0
        }
        
        var node = head
        var count = 1
        
        while node?.next != nil {
            node = node?.next
            count += 1
        }
        return count
    }
    var currentList: [T?] {
        if head == nil {
            return []
        }
        var list: [T?] = []
        var node = head
        
        for _ in 0..<count {
            list.append(node?.data)
            node = node?.next
        }
        return list
    }
    
    init(elements: [T] = []) {
        elements.forEach {
            append(data: $0)
        }
    }
    
    func append(data: T) {
        if head == nil {
            head = Node(data)
        } else {
            var node = head
            
            while node?.next != nil {
                node = node?.next
            }
            node?.next = Node(data)
        }
    }
    
    @discardableResult
    func removeFirst() -> T? {
        guard head != nil else {
            return nil
        }
        
        let removedNode = head
        head = head?.next
        
        return removedNode?.data
    }
    
    func clear() {
        head = nil
    }
}
