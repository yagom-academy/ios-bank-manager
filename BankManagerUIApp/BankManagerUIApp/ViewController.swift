//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    let baseVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(baseVerticalStackView)
        baseVerticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        baseVerticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        baseVerticalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        baseVerticalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        baseVerticalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
    }
}

