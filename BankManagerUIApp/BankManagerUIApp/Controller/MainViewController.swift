//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    let mainStackView: MainStackView = MainStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainStackView)
        mainStackView.setConstraints(from: self.view)
    }
    
//    func tappedAddButton(_ sender: UIButton) {
//        
//    }
}
