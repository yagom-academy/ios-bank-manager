//
//  BankManagerUIApp - ViewController.swift
//  Created by Eddy, dudu.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class BankViewController: UIViewController {
    private lazy var bankView = BankView(frame: view.bounds)
    private let bank = Bank(loanWindow: BankLoanWindow(), depositWindow: BankDepositWindow())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        bind()
    }
}

extension BankViewController {
    private func attribute() {
        bankView.backgroundColor = .systemBackground
        bank.delegate = self
    }
    
    private func bind() {
        view = bankView
        bankView.addCustomerbutton.addTarget(self, action: #selector(addCustomerButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addCustomerButtonTapped() {
        let customers = BankCustomer.make(numberOfCustomer: 10)
        
        customers.forEach { customer in
            bankView.waitStackView.addArrangedSubview(CustomerView(customer: customer))
        }
        
        bank.add(customers: customers)
        bank.open()
    }
}

extension BankViewController: BankDelegate {
    func bankWorkDidFinish(_ bank: Bank) { }
    
    func customerWorkDidStart(_ bank: Bank, id: String) {
        DispatchQueue.main.async { [weak self] in
            guard let customerViews = self?.bankView.waitStackView.arrangedSubviews as? [CustomerView] else { return }
            
            guard let targetView = customerViews.filter({ customerView in
                customerView.customer.id == id
            }).first else { return }
            
            targetView.removeFromSuperview()
            self?.bankView.workStackView.addArrangedSubview(targetView)
        }
    }
    
    func customerWorkDidFinish(_ bank: Bank, id: String) {
        DispatchQueue.main.async { [weak self] in
            guard let customerViews = self?.bankView.workStackView.arrangedSubviews as? [CustomerView] else { return }
            
            guard let targetView = customerViews.filter({ customerView in
                customerView.customer.id == id
            }).first else { return }
            
            targetView.removeFromSuperview()
        }
    }
}
