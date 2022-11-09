//
//  BankManagerUIApp - CustomerQueueStackView.swift
//  Created by Ayaan, Som, Dragon.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class CustomerQueueStackView: UIStackView {
    private let waitingCustomerScrollView: CustomerScrollView = CustomerScrollView()
    private let workingCustomerScrollView: CustomerScrollView = CustomerScrollView()
    
    init() {
        super.init(frame: .zero)
        configure()
        setSubView()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        self.alignment = .fill
        self.distribution = .fillEqually
        self.axis = .horizontal
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setSubView() {
        self.addArrangedSubview(waitingCustomerScrollView)
        self.addArrangedSubview(workingCustomerScrollView)
    }
    
    func addWaitingCustomers(_ customers: [Customer]) {
        customers.forEach {
            waitingCustomerScrollView.addCustomerLabel(CustomerLabelMaker.make(of: $0))
        }
    }
}
