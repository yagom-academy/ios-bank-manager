//
//  CustomerLabel.swift
//  BankManagerUIApp
//
//  Created by brody, christy, harry on 2023/03/15.
//

import UIKit

final class CustomerLabel: UILabel {
    init(_ customer: Customer) {
        super.init(frame: .zero)
        self.tag = customer.waitingNumber
        self.text = "\(customer.waitingNumber) - \(customer.businessType.rawValue)"
        self.textAlignment = .center
        self.font = .preferredFont(forTextStyle: .title2)
        
        switch customer.businessType {
        case .deposit:
            self.textColor = .label
        case .loan:
            self.textColor = .systemPurple
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
