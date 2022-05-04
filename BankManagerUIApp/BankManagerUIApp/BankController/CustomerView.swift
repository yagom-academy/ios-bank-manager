//
//  CustomerView.swift
//  BankManagerUIApp
//
//  Created by Eddy on 2022/05/03.
//

import UIKit

class CustomerView: UIView {
    let customer: Customer
    
    init(customer: Customer) {
        self.customer = customer
        super.init()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var customerLabel: UILabel = {
        let label = UILabel()
        
        if customer.workType == .loan {
            label.textColor = .systemPurple
        }

        label.text = "\(customer.waitingNumber) - \(customer.workType.name)"
        
        return label
    }()
}

// MARK: - layout

extension CustomerView {
    
    private func layout() {
        customerLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(customerLabel)
        
        // MARK: - customerLabel
        
        NSLayoutConstraint.activate([
            customerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            customerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            customerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            customerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
