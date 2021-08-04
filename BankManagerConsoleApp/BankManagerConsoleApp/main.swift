//
//  BankManagerConsoleApp - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var numberOfClients = UInt.random(in: 10...30)

let bankManager = BankManager()
try? bankManager.chooseOption()
