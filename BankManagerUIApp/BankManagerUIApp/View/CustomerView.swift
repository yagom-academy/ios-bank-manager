//
//  CustomerView.swift
//  BankManagerUIApp
//
//  Created by kyungmin on 2023/07/20.
//

import UIKit

final class CustomerView: UIView {
    let customer: Customer
    
    var customerLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(customer: Customer, frame: CGRect) {
        self.customer = customer
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        self.addSubview(customerLabel)
        customerLabel.text = "\(customer.waitingNumber) - \(customer.purpose.name)"
        customerLabel.textColor = customer.purpose.uiColor
        customerLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            customerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            customerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            customerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            customerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
