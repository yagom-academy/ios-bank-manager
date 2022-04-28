//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private enum Constant {
        static let open = "1 : 은행개점"
        static let close = "2 : 종료"
        static let input = "입력 : "
        static let empty = ""
    }
    
    private let bank = Bank()
    
