//
//  BankManagerUIApp - ViewController.swift
//  Created by OneTool, Red
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var bankManager = BankManager()
    private lazy var mainView = MainView(frame: view.frame)

    override func viewDidLoad() {
        self.view = mainView
        bankManager = BankManager()
    }
}

