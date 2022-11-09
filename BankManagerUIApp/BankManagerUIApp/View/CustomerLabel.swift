//
//  BankManagerUIApp - CustomerLabel.swift
//  Created by Ayaan, Som, Dragon.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

protocol CanHaveCustomer {
    var customer: Customer? { get set }
}

final class DepositCustomerLabel: UILabel, CanHaveCustomer {
    var customer: Customer?
    
    init(_ customer: Customer) {
        super.init(frame: .zero)
        self.customer = customer
        self.text = "\(customer.waitingNumber) - \(customer.bankingService.name)"
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.textAlignment = .center
        self.textColor = .black
        self.font = UIFont.preferredFont(forTextStyle: .body)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

final class LoanCustomerLabel: UILabel, CanHaveCustomer {
    var customer: Customer?
    
    init(_ customer: Customer) {
        super.init(frame: .zero)
        self.customer = customer
        self.text = "\(customer.waitingNumber) - \(customer.bankingService.name)"
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.textAlignment = .center
        self.textColor = .purple
        self.font = UIFont.preferredFont(forTextStyle: .body)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
