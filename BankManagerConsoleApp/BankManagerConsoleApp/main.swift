//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

extension String: Queueable {}
extension Int: Queueable {}

var queue = BankCustomerQueue<String>()
queue.enqueue("123")
//queue.enqueue(123)

print(queue.head?.data, queue.tail?.data)

