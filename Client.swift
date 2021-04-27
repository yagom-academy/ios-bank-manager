//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class Client: Operation {
    var waitingNumber: Int?
    
    override func main() {
        guard let client = waitingNumber else {
            return
        }
        print("\(client)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: Double.duration)
    }
}

extension Double {
    static let duration = 0.7
}
