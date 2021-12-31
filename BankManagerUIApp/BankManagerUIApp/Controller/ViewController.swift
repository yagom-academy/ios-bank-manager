//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

protocol TimerDelegate: AnyObject {
    func setupLabel(second: Int, milisecond: Int, nanoSecond: Int)
}

class ViewController: UIViewController {
    private let bankStackView = CustomStackView(axis: .vertical, spacing: 5, distribution: .fillEqually, alignment: .fill)
    private var processingTimeLabel = UILabel()
    private let waitingCustomerStackView = CustomStackView(axis: .vertical, spacing: 5, distribution: .equalSpacing, alignment: .center)
    private let bankPrinter = BankPrinter()
    private var bank: Bank?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bank = BankFactory.createBank(with: bankPrinter)
        setupUI()
    }
    
    func setupUI() {
        setupBankStackView()
        setupButtons()
        setupProcessingTimeLabel()
    }
    
    func setupBankStackView() {
        self.view.addSubview(bankStackView)
        bankStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bankStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            bankStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            bankStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    func setupButtons() {
        let buttonStackView = CustomStackView(axis: .horizontal, spacing: .zero, distribution: .fillEqually, alignment: .center)
        let addCustomerButton = CustomButton(title: "고객 10명 추가", textColor: .blue)
        let resetButton = CustomButton(title: "초기화", textColor: .red)
        addCustomerButton.addTarget(self, action: #selector(setupCustomerQueue), for: .touchUpInside)
        
        [addCustomerButton, resetButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        
        bankStackView.addArrangedSubview(buttonStackView)
    }
    
    @objc func setupCustomerQueue() {
        bank?.setupCustomerQueue(with: 10)
    }
    
    func setupProcessingTimeLabel() {
        processingTimeLabel.text = "업무시간 - 00:00:000"
        processingTimeLabel.textAlignment = .center
        bankStackView.addArrangedSubview(processingTimeLabel)
    }
    
    func setupCustomerView() {
        guard let customers = bank?.returnAllCustomers() else {
            return
        }
        
        let waitingCustomerScrollView = UIScrollView()
        let waitingCustomerContentView = UIView()
        
        customers.forEach { customer in
            let waitingCustomerLabel = CustomLabel(order: customer.turn, type: customer.task)
            waitingCustomerStackView.addArrangedSubview(waitingCustomerLabel)
        }
        
        self.view.addSubview(waitingCustomerScrollView)
        waitingCustomerScrollView.addSubview(waitingCustomerContentView)
        waitingCustomerContentView.addSubview(waitingCustomerStackView)
        
        [waitingCustomerScrollView, waitingCustomerContentView, waitingCustomerStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            waitingCustomerScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 400),
            waitingCustomerScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            waitingCustomerScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.view.frame.width / 2),
            waitingCustomerScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            waitingCustomerContentView.topAnchor.constraint(equalTo: waitingCustomerScrollView.topAnchor),
            waitingCustomerContentView.leadingAnchor.constraint(equalTo: waitingCustomerScrollView.leadingAnchor),
            waitingCustomerContentView.trailingAnchor.constraint(equalTo: waitingCustomerScrollView.trailingAnchor),
            waitingCustomerContentView.bottomAnchor.constraint(equalTo: waitingCustomerScrollView.bottomAnchor),
            waitingCustomerContentView.widthAnchor.constraint(equalTo: waitingCustomerScrollView.widthAnchor),
            
            waitingCustomerStackView.topAnchor.constraint(equalTo: waitingCustomerContentView.topAnchor),
            waitingCustomerStackView.leadingAnchor.constraint(equalTo: waitingCustomerContentView.leadingAnchor),
            waitingCustomerStackView.trailingAnchor.constraint(equalTo: waitingCustomerContentView.trailingAnchor),
            waitingCustomerStackView.bottomAnchor.constraint(equalTo: waitingCustomerContentView.bottomAnchor)
        ])
    }
}

extension ViewController: TimerDelegate {
    func setupLabel(second: Int, milisecond: Int, nanoSecond: Int) {
        let formattedSecond = second < 10 ? "0\(second)" : "\(second)"
        processingTimeLabel.text = "업무시간 - \(formattedSecond):\(milisecond):\(nanoSecond)"
    }
}


