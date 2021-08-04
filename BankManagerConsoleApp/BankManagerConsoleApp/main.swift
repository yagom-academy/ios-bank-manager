//
//  BankManagerConsoleApp - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let minimumClients: UInt = 10
let maximumClients: UInt = 30

var numberOfClients = UInt.random(in: minimumClients...maximumClients)

let bankManager = BankManager()
try? bankManager.chooseOption()
