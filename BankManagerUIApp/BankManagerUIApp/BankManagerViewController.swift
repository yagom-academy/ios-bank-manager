//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright Donnie, Safari. All rights reserved.
// 

import UIKit

final class BankManagerViewController: UIViewController {
    private lazy var bankManagerView = BankManagerView.init(frame: self.view.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    private func configureView() {
        self.view = bankManagerView
    }
}

