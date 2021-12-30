//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var bank: Bank? = Bank()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = BankManagerView()
        guard let bankView = view as? BankManagerView else {
            return
        }
        bankView.addClientsButton.addTarget(self, action: #selector(addClients), for: .touchUpInside)
    }
    
    @objc func addClients() {
        bank?.addClientsToQueue(by: 10)
        bank?.startBankingService()
    }
}
