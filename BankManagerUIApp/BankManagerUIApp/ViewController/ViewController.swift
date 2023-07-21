//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit
import CustomerPackage

class BankManagerViewController: UIViewController {
    private let bankManagerView = BankManagerView()
    private var bank = Bank()
    private let workTimer = WorkTimer()
    
    override func loadView() {
        super.loadView()
        
        self.view = bankManagerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bankManagerView.delegate = self
        workTimer.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(addCustomerToWork(_:)), name: NSNotification.Name("업무시작"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(deleteCustomerToWork(_:)), name: NSNotification.Name("업무종료"), object: nil)
    }
    
    @objc private func addCustomerToWork(_ notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let customer = userInfo["고객"] as? Customer else { return }
        
        OperationQueue.main.addOperation { [self] in
            bankManagerView.deleteLabelInWaitStackView(customer)
            bankManagerView.addLabelInWorkStackView(customer)
        }
    }
    
    @objc private func deleteCustomerToWork(_ notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let customer = userInfo["고객"] as? Customer else { return }
        
        OperationQueue.main.addOperation { [self] in
            bankManagerView.deleteLabelInWorkStackView(customer)
        }
    }
}

// MARK: - BankManagerViewDelegate
extension BankManagerViewController: BankManagerViewDelegate {
    func didTappedAddCustomerButton() {
        let customers = bank.addCustomer()
        bank.updateWaitingLine(customers)
        
        customers.forEach {
            bankManagerView.addLabelInWaitStackView($0)
        }
    }
    
    func didTappedClearButton() {
        bank.stopBankService()
        bankManagerView.clearAllStackView()
    }
}

// MARK: - WorkTimerDelegate
extension BankManagerViewController: WorkTimerDelegate {
    func updateTime(_ time: String) {
        OperationQueue.main.addOperation { [self] in
            bankManagerView.setUpTimerLabel(time)
        }
    }
}
