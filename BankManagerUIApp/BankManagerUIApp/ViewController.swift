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
    
    let buttonHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    let addCustomerButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    let clearButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(baseVerticalStackView)
        
        // Buttons
        buttonHorizontalStackView.addArrangedSubview(addCustomerButton)
        buttonHorizontalStackView.addArrangedSubview(clearButton)
        baseVerticalStackView.addArrangedSubview(buttonHorizontalStackView)
        
        baseVerticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        baseVerticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        baseVerticalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        baseVerticalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        baseVerticalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
    }
}

