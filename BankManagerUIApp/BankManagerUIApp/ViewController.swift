//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let addClientsButton = UIButton()
    let initializeButton = UIButton()
    let serviceTimeLabel = UILabel()
    let waitingClientsLabel = UILabel()
    let processingClientsLabel = UILabel()
    let waitingClientsStackView = UIStackView()
    let processingClientsStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAllUIComponents()
    }
}

//MARK: View Initialization
extension ViewController {
    private func initAllUIComponents() {
        initButtons()
    }
    private func initButtons() {
        addClientsButton.setTitle("고객 10명 추가", for: .normal)
        addClientsButton.setTitleColor(.systemBlue, for: .normal)
        addClientsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addClientsButton)
        addClientsButton.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor
        ).isActive = true
        addClientsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        addClientsButton.widthAnchor.constraint(
            equalTo: view.widthAnchor,
            multiplier: 0.5
        ).isActive = true
        
        initializeButton.setTitle("초기화", for: .normal)
        initializeButton.setTitleColor(.systemRed, for: .normal)
        initializeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(initializeButton)
        initializeButton.topAnchor.constraint(equalTo: addClientsButton.topAnchor).isActive = true
        initializeButton.leadingAnchor.constraint(
            equalTo: addClientsButton.trailingAnchor
        ).isActive = true
        initializeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        initializeButton.bottomAnchor.constraint(
            equalTo: addClientsButton.bottomAnchor
        ).isActive = true
    }
    
}
