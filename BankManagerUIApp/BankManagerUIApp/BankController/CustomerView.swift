//
//  CustomerView.swift
//  BankManagerUIApp
//
//  Created by Eddy on 2022/05/03.
//

import UIKit

final class CustomerView: UIView {
    let customer: Customer
    
    init(customer: Customer) {
        self.customer = customer
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var customerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        if customer.workType == .loan {
            label.textColor = .systemPurple
        }

        label.text = "\(customer.waitingNumber) - \(customer.workType.name)"
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .callout)
        
        return label
    }()
}

// MARK: - layout

extension CustomerView {
    
    private func layout() {
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
