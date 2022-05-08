//
//  BankManagerUIApp - ViewController.swift
//  Created by Eddy, dudu.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

private enum Const {
    static let numberOfCusomter = 10
}

final class BankViewController: UIViewController {
    private lazy var bankView = BankView(frame: view.bounds)
    private let bank = Bank(loanWindow: BankLoanWindow(), depositWindow: BankDepositWindow())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAttribute()
        bind()
    }
}

extension BankViewController {
    private func configureAttribute() {
        bankView.backgroundColor = .systemBackground
        bank.delegate = self
    }
    
    private func bind() {
        view = bankView
        bankView.addCustomerButton.addTarget(self, action: #selector(addCustomerButtonTapped), for: .touchUpInside)
        bankView.resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addCustomerButtonTapped() {
        let customers = BankCustomer.make(startNumber: bank.waitingNumber, count: Const.numberOfCusomter)
        let customerViews = customers.map { CustomerView(customer: $0) }
        
        bankView.waitStackView.addArrangedSubViews(customerViews)
        
        bank.add(customers: customers)
    }
    
    @objc private func resetButtonTapped() {
        bankView.workStackView.removeAllSubViews()
        bankView.waitStackView.removeAllSubViews()
        
        bank.reset()
    }
}

extension BankViewController: BankDelegate {
    func secondsDidChange(_ bank: Bank, seconds: Double) {
        bankView.timerLabel.text = seconds.formattedTime
    }
    
    func customerWorkDidStart(_ bank: Bank, id: String) {
        DispatchQueue.main.async {
            guard let customerViews = self.bankView.waitStackView.arrangedSubviews as? [CustomerView] else { return }
            
            guard let targetView = customerViews.first(where: {
                $0.customerId == id }) else { return }
            
            targetView.removeFromSuperview()
            self.bankView.workStackView.addArrangedSubview(targetView)
        }
    }
    
    func customerWorkDidFinish(_ bank: Bank, id: String) {
        DispatchQueue.main.async {
            guard let customerViews = self.bankView.workStackView.arrangedSubviews as? [CustomerView] else { return }
            
            guard let targetView = customerViews.first(where: {
                $0.customerId == id }) else { return }
            
            targetView.removeFromSuperview()
        }
    }
}
