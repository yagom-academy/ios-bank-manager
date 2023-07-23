//
//  CustomerView.swift
//  BankManagerUIApp
//
//  Created by kyungmin on 2023/07/20.
//

import UIKit

final class CustomerView: UILabel {
    let customer: Customer
    
    init(customer: Customer, frame: CGRect) {
        self.customer = customer
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        self.text = "\(customer.waitingNumber) - \(customer.purpose.name)"
        self.textColor = customer.purpose.uiColor
        self.textAlignment = .center
    }
}
