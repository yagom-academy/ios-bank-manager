//
//  CustomerLabel.swift
//  BankManagerUIApp
//
//  Created by 강민수 on 2023/03/17.
//

import UIKit

final class CustomerLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(customer: Customer) {
        self.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.adjustsFontForContentSizeCategory = true
        self.text = "\(customer.waitingNumber) - \(customer.desiredBanking)"
        self.textColor = customer.fontColor
        self.font = .preferredFont(forTextStyle: .title3)
    }
}
