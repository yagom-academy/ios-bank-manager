//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class BankManagerViewController: UIViewController {
    private let bankManagerView = BankManagerView()
    
    override func loadView() {
        super.loadView()
        
        self.view = bankManagerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(addCustomerToWork(_:)), name: NSNotification.Name("업무시작"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(deleteCustomerToWork(_:)), name: NSNotification.Name("업무종료"), object: nil)
    }
    
    @objc private func addCustomerToWork(_ notification: NSNotification) {
        
    }
    
    @objc private func deleteCustomerToWork(_ notification: NSNotification) {
        
    }
}

