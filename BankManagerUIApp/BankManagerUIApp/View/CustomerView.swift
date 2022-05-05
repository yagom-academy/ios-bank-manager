//
//  CustomerView.swift
//  BankManagerUIApp
//
//  Created by Donnie, Safari on 2022/05/05.
//

import Foundation
import UIKit

class CustomerView: UIView {
    private let number: Int
    private let task: String
    
    init(frame: CGRect, number: Int, task: String) {
        self.number = number
        self.task = task
        super.init(frame: frame)
        configureCustomerViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var customerLabel: UILabel = {
        let label = UILabel()
        label.text = "\(number) - \(task)"
        label.font = .preferredFont(forTextStyle: .title2)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        if task == "대출" {
            label.textColor = .systemPurple
        }
        return label
    }()
}

// MARK: - AutoLayout Method
private extension CustomerView {
    func configureCustomerViewLayout() {
        self.addSubview(customerLabel)
        
        NSLayoutConstraint.activate([
            customerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            customerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            customerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            customerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
