//
//  File.swift
//  
//
//  Created by Hisop on 2023/11/15.
//

@testable import BankManager

extension LinkedList: Equatable where T:Equatable {
    convenience init(list: [T]) {
        var nodeList: [Node] = []
        
        self.init()
        
        list.forEach { nodeList.append(Node(value: $0)) }
        linkNode(nodeList: nodeList)
    }
    
    private func linkNode(nodeList: [Node]) {
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
    
    public static func == (lhs: LinkedList, rhs: LinkedList) -> Bool {
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
