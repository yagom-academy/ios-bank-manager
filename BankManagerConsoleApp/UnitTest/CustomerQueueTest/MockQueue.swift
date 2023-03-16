//
//  MockQueue.swift
//  CustomerQueueTest
//
//  Created by Rowan, 릴라 on 2023/03/14.
//

import XCTest

struct MockQueue<T>: Queueable {
    var list: LinkedList<T> = LinkedList()
}
