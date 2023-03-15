//
//  CustomerLabel.swift
//  BankManagerUIApp
//
//  Created by 릴라, Rowan on 2023/03/15.
//

import UIKit

class CustomerLabel: UILabel {
    let customer: Customer
    
    init(frame: CGRect, customer: Customer) {
        self.customer = customer
        super.init(frame: frame)
        
        configureProperties()
    }
    
    convenience init(customer: Customer) {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0), customer: customer)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureProperties() {
        guard let business = customer.business else { return }
        self.text = "\(customer.numberTicket) - \(business.rawValue)"
        self.textAlignment = .center
        self.font = .preferredFont(forTextStyle: .title2)
        
        switch business {
        case .loan:
            self.textColor = .systemPurple
        case .deposit:
            self.textColor = .black
        }
    }
}
