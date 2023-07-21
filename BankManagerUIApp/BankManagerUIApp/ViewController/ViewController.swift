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
    }
}

