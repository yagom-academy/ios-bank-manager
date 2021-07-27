//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/07/27.
//

import Foundation

class LinkedList<Value> {
    private var head: Node<Value>?
    private var tail: Node<Value>?
    
    // ieEmpty - 굳이 왜 연산프로퍼티일까?? 그러게요...음.. 흐음 public -흐음
    // 연산프로퍼트 vs 메소드
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func push(_ value: Value) {
        if isEmpty() && tail == nil {
            head = Node(value: value)
            tail = head
        }
    }
}
