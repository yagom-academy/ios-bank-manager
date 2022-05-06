//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    private lazy var bankView = BankView(frame: view.bounds)
    var bank = Bank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = bankView
        setButtons()
        bank.delegate = self
    }
    
    private func setButtons() {
        bankView.addCustomerButton.addTarget(self, action: #selector(addCustomer), for: .touchUpInside)
        bankView.resetButton.addTarget(self, action: #selector(setInitialState), for: .touchUpInside)
    }
    
    @objc private func addCustomer() {
        bank.openBank()
    }
    
    @objc private func setInitialState() {
        print("초기화됨")
    }
}

extension ViewController: BankDelegate {
    func customerLabel(customer: Customer) -> UILabel {
        let label = UILabel()
         label.textAlignment = .center
         label.font = UIFont.preferredFont(forTextStyle: .title3)
         if customer.task == .loan {
             label.textColor = .systemPurple
         }
         label.text = "\(customer.number) - \(customer.task.title)"
         return label
    }
    
    func sendAddedCustomer(customer: Customer) {
        bankView.waitingStackView.addArrangedSubview(customerLabel(customer: customer))
    }
    
    func sendTaskingCustomer(customer: Customer) {
        DispatchQueue.main.async {
            self.bankView.waitingStackView.arrangedSubviews.forEach {
                let label = $0 as? UILabel
                if label?.text == "\(customer.number) - \(customer.task.title)" {
                    $0.removeFromSuperview()
                    self.bankView.taskingStackView.addArrangedSubview($0)
                }
            }
        }
    }
    
    func sendEndCustomer(customer: Customer) {
        //
    }
    
    func sendFinishWork() {
        //
    }
}
