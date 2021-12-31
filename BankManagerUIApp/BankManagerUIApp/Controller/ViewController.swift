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
    private let bankStackView = CustomStackView(axis: .vertical, spacing: 10, distribution: .fill, alignment: .fill)
    private let waitingCustomerStackView = CustomStackView(axis: .vertical, spacing: 5, distribution: .equalSpacing, alignment: .center)
    private let processingCustomerStackView = CustomStackView(axis: .vertical, spacing: 5, distribution: .equalSpacing, alignment: .center)
    private var processingTimeLabel = UILabel()
    
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
        setupCustomerView()
    }
    
    func setupBankStackView() {
        self.view.addSubview(bankStackView)
        bankStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bankStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            bankStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            bankStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            bankStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
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
        let waitingAndProcessingStackView = CustomStackView(axis: .horizontal, spacing: 0, distribution: .fillEqually, alignment: .fill)
        [waitingCustomerStackView, processingCustomerStackView].forEach { stackView in
            let customerStackView = CustomStackView(axis: .vertical, spacing: 10, distribution: .equalSpacing, alignment: .fill)
            
            let waitingLabel = UILabel()
            waitingLabel.text = "대기중"
            waitingLabel.textColor = .white
            waitingLabel.textAlignment = .center
            waitingLabel.backgroundColor = .systemGreen
            
            let waitingCustomerScrollView = UIScrollView()
            let waitingCustomerContentView = UIView()
            
            customers.forEach { customer in
                let waitingCustomerLabel = CustomLabel(order: customer.turn, type: customer.task)
                stackView.addArrangedSubview(waitingCustomerLabel)
            }
            
            waitingAndProcessingStackView.addArrangedSubview(customerStackView)
            customerStackView.addArrangedSubview(waitingLabel)
            customerStackView.addArrangedSubview(waitingCustomerScrollView)
            
            waitingCustomerScrollView.addSubview(waitingCustomerContentView)
            waitingCustomerContentView.addSubview(stackView)
            
            [customerStackView, waitingCustomerScrollView, waitingCustomerContentView, stackView].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
            
            NSLayoutConstraint.activate([
                customerStackView.bottomAnchor.constraint(equalTo: waitingAndProcessingStackView.bottomAnchor),
                
                waitingCustomerScrollView.topAnchor.constraint(equalTo: waitingLabel.bottomAnchor, constant: 15),
                waitingCustomerScrollView.leadingAnchor.constraint(equalTo: customerStackView.leadingAnchor),
                waitingCustomerScrollView.trailingAnchor.constraint(equalTo: customerStackView.trailingAnchor),
                waitingCustomerScrollView.bottomAnchor.constraint(equalTo: customerStackView.bottomAnchor),
                
                waitingCustomerContentView.topAnchor.constraint(equalTo: waitingCustomerScrollView.topAnchor),
                waitingCustomerContentView.leadingAnchor.constraint(equalTo: waitingCustomerScrollView.leadingAnchor),
                waitingCustomerContentView.trailingAnchor.constraint(equalTo: waitingCustomerScrollView.trailingAnchor),
                waitingCustomerContentView.bottomAnchor.constraint(equalTo: waitingCustomerScrollView.bottomAnchor),
                waitingCustomerContentView.widthAnchor.constraint(equalTo: waitingCustomerScrollView.widthAnchor),
                
                stackView.topAnchor.constraint(equalTo: waitingCustomerContentView.topAnchor),
                stackView.leadingAnchor.constraint(equalTo: waitingCustomerContentView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: waitingCustomerContentView.trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: waitingCustomerContentView.bottomAnchor)
            ])
        }
        
        bankStackView.addArrangedSubview(waitingAndProcessingStackView)
        
    }
}

extension ViewController: TimerDelegate {
    func setupLabel(second: Int, milisecond: Int, nanoSecond: Int) {
        let formattedSecond = second < 10 ? "0\(second)" : "\(second)"
        processingTimeLabel.text = "업무시간 - \(formattedSecond):\(milisecond):\(nanoSecond)"
    }
}


