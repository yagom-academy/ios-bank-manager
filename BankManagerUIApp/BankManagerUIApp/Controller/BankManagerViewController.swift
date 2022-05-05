//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright Donnie, Safari. All rights reserved.
// 

import UIKit

final class BankManagerViewController: UIViewController {
    private lazy var bankManagerView = BankManagerView.init(frame: self.view.bounds)
    private var bank = Bank(depositClerkCount: 2, loanClerkCount: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        configureView()
    }
    
    private func configureButtons() {
        bankManagerView.addCustomersButton.addTarget(self, action: #selector(addCustomersButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addCustomersButtonTapped() {
        bank.addCustomers().forEach { customer in
            guard let information = customer.task?.information else { return }
            bankManagerView.waitingVerticalStackView.addArrangedSubview(CustomerView(frame: .zero,
                                                                                     number: customer.numberTicket,
                                                                                     task: information))
        }
    }
    
    private func configureView() {
        self.view = bankManagerView
    }
}

