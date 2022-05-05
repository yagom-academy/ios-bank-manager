//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    lazy var bankView = BankView(frame: view.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = bankView
    }
}

