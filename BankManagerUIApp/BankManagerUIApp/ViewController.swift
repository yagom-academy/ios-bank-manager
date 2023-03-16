//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class BankManagerViewController: UIViewController {
    private let mainStackView: UIStackView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainStackView()
        addButton()
        addTimeLabel()
    }
    
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func addButton() {
        let addClientButton: UIButton = .init()
        let resetButton: UIButton = .init()
        addClientButton.setAttributedTitle(NSAttributedString(string: "고객 10명 추가"), for: .normal)
        addClientButton.titleLabel?.textColor = .systemBlue
        resetButton.setAttributedTitle(NSAttributedString(string: "초기화"), for: .normal)
        resetButton.titleLabel?.textColor = .systemRed
        
        let buttonStackView: UIStackView = .init()
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .center
        buttonStackView.distribution = .fillEqually
        
        mainStackView.addArrangedSubview(buttonStackView)
        buttonStackView.addArrangedSubview(addClientButton)
        buttonStackView.addArrangedSubview(resetButton)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func addTimeLabel() {
        let businessTime: UILabel = .init()
        
        businessTime.text = "업무 시간 - 04:33:253"
        businessTime.textAlignment = .center
        businessTime.backgroundColor = .green
        
        businessTime.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 20)
        
        
        mainStackView.addArrangedSubview(businessTime)
        
        businessTime.translatesAutoresizingMaskIntoConstraints = false
        businessTime.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}

