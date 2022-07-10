//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var mainView: MainView?
    private var bank: Bank?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView = MainView(self)
        makeBankInstance()
    private func makeBankInstance() {
        bank = Bank(employee: makeManagerInstance(), customer: CustomerQueue())
        bank?.delegate = self
    }
    
    private func makeManagerInstance() -> BankManager {
        var manager = BankManager()
        manager.delegate = self
        return manager
    }
extension ViewController: Showable {
    
    func allWorkisFinished() {
        timer?.invalidate()
    }
    
    func startProcess(about customer: Customer) {
        guard let mainView = mainView else {
            return
        }
        let customerOnProcessing = "\(customer.number) - \(customer.business.name)"
        
        DispatchQueue.main.async {
            let labelList = mainView.waitingStackView.arrangedSubviews.compactMap {
                $0 as? UILabel
            }.filter {
                $0.text == customerOnProcessing
            }
            
            guard let label = labelList.first else {
                return
            }
            
            mainView.waitingStackView.removeSubview(label)
            mainView.addProcessInProcessingStackView(text: customerOnProcessing)
        }
    }
    
    func endProcess(about customer: Customer) {
        guard let mainView = mainView else {
            return
        }
        let customerOnProcessing = "\(customer.number) - \(customer.business.name)"
        
        DispatchQueue.main.async {
            let labelList = mainView.processingStackView.arrangedSubviews.compactMap {
                $0 as? UILabel
            }.filter {
                $0.text == customerOnProcessing
            }
            
            guard let label = labelList.first else {
                return
            }
            
            mainView.processingStackView.removeSubview(label)
        }
    }
}

