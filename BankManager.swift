//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private enum Menu: String {
        case open = "1"
        case close = "2"

        var userInput: String {
            self.rawValue
        }
    }
}
