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
        fatalError("init(coder:) has not been implemented")
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
    
    func reset() {
        waitingCustomerScrollView.removeAllCustomerLabels()
        workingCustomerScrollView.removeAllCustomerLabels()
    }
    
    func removeWaitingCustomerLabel(of waitingNumber: Int) {
        guard let havingCustomer: CanHaveCustomer = waitingCustomerScrollView.removeCustomerLabel(of: waitingNumber) as? CanHaveCustomer,
              let customer: Customer = havingCustomer.customer else {
            return
        }
        
        workingCustomerScrollView.addCustomerLabel(CustomerLabelMaker.make(of: customer))
    }
    
    func removeWorkingCustomerLabel(of waitingNumber: Int) {
        workingCustomerScrollView.removeCustomerLabel(of: waitingNumber)
    }
}
