//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    var waitingLine = Queue<Int>()

    mutating func makeWaitingLine(by numberOfClients: Int) {
        (1...numberOfClients).forEach { client in
            waitingLine.enqueue(client)
        }
    }
}
