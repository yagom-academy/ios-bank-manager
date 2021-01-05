//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    private var tellers: [Teller] = []
    private var clients: [Client] = []
    private var needTimeToWork: Double = 0.7
    private var numberOfClients: Int {
        return clients.count
    }
    private var businessTimes: Double {
        return Double(numberOfClients) * needTimeToWork
    }
}
