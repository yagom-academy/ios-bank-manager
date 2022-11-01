//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

extension String: Queueable {}
extension Int: Queueable {}

var queue = BankCustomerQueue()
queue.enqueue("일이삼")
queue.enqueue(123)
if let firstData = queue.peek(),
   let secondData = queue.dequeue(),
   let thirdData = queue.dequeue() {
    print(firstData)
    print(secondData)
    print(thirdData)
    print(queue.isEmpty())
}
