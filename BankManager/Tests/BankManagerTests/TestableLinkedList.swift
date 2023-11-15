//
//  File.swift
//  
//
//  Created by Hisop on 2023/11/15.
//

@testable import BankManager

final class TestableLinkedList<T: Equatable>: LinkedList<T> {
    private var nodeList: [Node] = []
    
    private func linkNode() {
        for node in nodeList {
            if head == nil {
                head = node
            } else {
                tail?.next = node
            }
            tail = node
            count += 1
        }
    }
    
    override init() {
        super.init()
    }
    
    init(list: [T]) {
        super.init()
        list.forEach { nodeList.append(Node(value: $0)) }
        linkNode()
    }
}

extension TestableLinkedList: Equatable {
    static func == (lhs: TestableLinkedList, rhs: TestableLinkedList) -> Bool {
        var currentLhs = lhs.head
        var currentRhs = rhs.head
        
        while currentLhs != nil || currentRhs != nil {
            guard currentLhs != nil && currentRhs != nil else {
                return false
            }
            
            guard currentLhs?.value == currentRhs?.value else {
                return false
            }
            
            currentLhs = currentLhs?.next
            currentRhs = currentRhs?.next
        }
        
        return true
    }
}
