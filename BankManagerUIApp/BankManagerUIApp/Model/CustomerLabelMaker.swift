//
//  BankManagerUIApp - CustomerLabelMaker.swift
//  Created by Ayaan, Som, Dragon.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit.UILabel

enum CustomerLabelMaker {
    static func make(of customer: Customer) -> UILabel {
        switch customer.bankingService {
        case .deposit:
            return DepositCustomerLabel(customer)
        case .loan:
            return LoanCustomerLabel(customer)
        }
    }
}
