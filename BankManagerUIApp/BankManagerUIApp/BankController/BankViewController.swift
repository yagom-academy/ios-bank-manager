//
//  BankManagerUIApp - ViewController.swift
//  Created by Eddy, dudu.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class BankViewController: UIViewController {
    private lazy var bankView = BankView(frame: view.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = bankView
        bankView.backgroundColor = .systemBackground
    }
}
