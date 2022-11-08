//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import BankCustomerQueue

var bank: Bank = Bank(depositBankerCount: 2, loanBankerCount: 1)

bank.startBusiness()
