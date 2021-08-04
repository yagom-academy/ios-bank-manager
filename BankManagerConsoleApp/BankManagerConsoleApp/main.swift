//
//  BankManagerConsoleApp - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let minimumClients = 10
let maximumClients = 30

var numberOfClients = UInt.random(in: minimumClients...maximumClients)

let bankManager = BankManager()
try? bankManager.chooseOption()
