//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    private lazy var bankView = BankView(frame: view.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = bankView
        setButtons()
    }
    
    private func setButtons() {
        bankView.addCustomerButton.addTarget(self, action: #selector(addCustomer), for: .touchUpInside)
        bankView.resetButton.addTarget(self, action: #selector(setInitialState), for: .touchUpInside)
    }
    
    @objc private func addCustomer() {
        print("고객추가됨")
    }
    
    @objc private func setInitialState() {
        print("초기화됨")
    }
}

