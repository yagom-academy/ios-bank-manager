//
//  BankManagerUIApp - CustomerScrollView.swift
//  Created by Ayaan, Som, Dragon.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class CustomerScrollView: UIScrollView {
    private let customerStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        configure()
        setSubView()
        setCustomerStackViewConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setSubView() {
        self.addSubview(customerStackView)
    }
    
    private func setCustomerStackViewConstraints() {
        NSLayoutConstraint.activate([
            customerStackView.topAnchor.constraint(equalTo: self.contentLayoutGuide.topAnchor),
            customerStackView.bottomAnchor.constraint(equalTo: self.contentLayoutGuide.bottomAnchor),
            customerStackView.trailingAnchor.constraint(equalTo: self.contentLayoutGuide.trailingAnchor),
            customerStackView.leadingAnchor.constraint(equalTo: self.contentLayoutGuide.leadingAnchor),
            customerStackView.widthAnchor.constraint(equalTo: self.frameLayoutGuide.widthAnchor)
        ])
        
        let heightConstraint: NSLayoutConstraint = customerStackView.heightAnchor.constraint(equalTo: self.frameLayoutGuide.heightAnchor)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
    }
    
    func addCustomerLabel(_ customerLabel: UILabel) {
        customerStackView.addArrangedSubview(customerLabel)
    }
    
    func removeAllCustomerLabels() {
        customerStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    @discardableResult
    func removeCustomerLabel(of waitingNumber: Int) -> UIView? {
        for subView in customerStackView.arrangedSubviews {
            if let label: CanHaveCustomer = subView as? CanHaveCustomer,
               let labelWaitingNumber: Int = label.customer?.waitingNumber,
               waitingNumber == labelWaitingNumber {
                subView.removeFromSuperview()
                
                return subView
            }
        }
        
        return nil
    }
}
