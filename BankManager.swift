//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let tellerNumber: Int
    private(set) var state: BankManagerState
    private var timeNeedToFinishTask: Double = 0.7

    init(number: Int) {
        self.tellerNumber = number
        self.state = .notWorking
    }
}
