//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit
import CustomerPackage

final class BankManagerViewController: UIViewController {
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
                
        NotificationCenter.default.addObserver(self, selector: #selector(addCustomerToWork(_:)), name: NSNotification.Name.workStart, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(deleteCustomerToWork(_:)), name: NSNotification.Name.workEnd, object: nil)
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
            
            if bankManagerView.isWaitAndWorkStackViewEmpty {
                workTimer.suspend()
            }
        }
    }
}

// MARK: - BankManagerViewDelegate
extension BankManagerViewController: BankManagerViewDelegate {
    func didTappedAddCustomerButton() {
        let customers = bank.addedCustomers()
        bank.updateWaitingLine(customers)
        
        customers.forEach {
            bankManagerView.addLabelInWaitStackView($0)
        }
        
        if !workTimer.isRunning {
            workTimer.start()
        }
    }
    
    func didTappedClearButton() {
        bank.stopBankService()
        bankManagerView.clearAllStackView()
        
        workTimer.clear()
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
