//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

private extension Double {
    var formattedToSecond : String {
        let second = self / 1000000000
        return String(format: "%.2f", second)
    }
}
