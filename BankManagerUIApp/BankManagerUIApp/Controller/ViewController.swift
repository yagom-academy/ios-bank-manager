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
    private var buttonStackView: CustomStackView?
    private var processingTimeLabel: UILabel?
    private let bankPrinter = BankPrinter()
    private var bank: Bank?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bank = BankFactory.createBank(with: bankPrinter)
    }
    
    func setupButtons() {
        buttonStackView = CustomStackView(axis: .horizontal, spacing: .zero, distribution: .fillEqually, alignment: .center)
        let addCustomerButton = CustomButton(title: "고객 10명 추가", textColor: .blue)
        let resetButton = CustomButton(title: "초기화", textColor: .red)
        addCustomerButton.addTarget(self, action: #selector(setupCustomerQueue), for: .touchUpInside)
        
        [addCustomerButton, resetButton].forEach {
            buttonStackView?.addArrangedSubview($0)
        }
    }
    
    @objc func setupCustomerQueue() {
        bank?.setupCustomerQueue(with: 10)
    }
}

extension ViewController: TimerDelegate {
    func setupLabel(second: Int, milisecond: Int, nanoSecond: Int) {
        let formattedSecond = second < 10 ? "0\(second)" : "\(second)"
        processingTimeLabel?.text = "업무시간 - \(formattedSecond):\(milisecond):\(nanoSecond)"
    }
}


