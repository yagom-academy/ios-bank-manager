//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    let addClientButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "고객 10명 추가"
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "초기화"
        button.titleLabel?.textColor = .systemRed
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setup()
        
    }
    
    func setup() {
        view.backgroundColor = .white
        addViews()
        setAutoLayout()
    }
    
    func addViews() {
        view.addSubview(addClientButton)
        view.addSubview(resetButton)
    }

    func setAutoLayout() {
        addClientButton.translatesAutoresizingMaskIntoConstraints = false
        addClientButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        addClientButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
        resetButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }

}

