//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var mainView: MainView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = MainView(self)
    }
}

