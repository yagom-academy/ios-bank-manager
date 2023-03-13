//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private let screenStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        stackView.axis = .vertical

        return stackView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually

        return stackView
    }()
    
    private let addClientsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        
        return button
    }()
    
    private let taskTimerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       setUpScreenStackView()
        
    }
    
    private func setUpScreenStackView() {
        view.addSubview(screenStackView)
        screenStackView.addArrangedSubview(buttonStackView)
        buttonStackView.addArrangedSubview(addClientsButton)
        buttonStackView.addArrangedSubview(resetButton)
        screenStackView.addArrangedSubview(taskTimerLabel)
        NSLayoutConstraint.activate([
            screenStackView.topAnchor.constraint(equalTo: view.topAnchor),
            screenStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            screenStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            screenStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            buttonStackView.topAnchor.constraint(equalTo: screenStackView.topAnchor, constant: 50)
        ])

    }


}
