//
//  CustomerQueue.swift
//  BankManagerUIApp
//
//  Created by Sunwoo on 2021/12/21.
//

import Foundation

struct CustomerQueue<T> {
    private var list = LinkedList<T>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
}


