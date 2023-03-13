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
        stackView.spacing = 10
        stackView.distribution = .fill

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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.text = "업무시간 - "
        
        return label
    }()
    
    private let queueStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        //stackView.setContentCompressionResistancePriority(UILayoutPriority.1, for: .horizontal)
        return stackView
    }()
    
    private let waitQueueStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical

        return stackView
    }()
    
    private let waitQueueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = "대기중"
        label.textColor = .white
        label.backgroundColor = .systemGreen
        
        return label
    }()
    
    private let doTaskStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical

        return stackView
    }()
    
    private let doTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = "업무중"
        label.backgroundColor = .systemIndigo
        label.textColor = .white
        
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
        screenStackView.addArrangedSubview(queueStackView)
        queueStackView.addArrangedSubview(waitQueueStackView)
        queueStackView.addArrangedSubview(doTaskStackView)
        waitQueueStackView.addArrangedSubview(waitQueueLabel)
        doTaskStackView.addArrangedSubview(doTaskLabel)
        
        NSLayoutConstraint.activate([
            screenStackView.topAnchor.constraint(equalTo: view.topAnchor),
            screenStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            screenStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            screenStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            buttonStackView.topAnchor.constraint(equalTo: screenStackView.topAnchor, constant: 50),
            taskTimerLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor),
            taskTimerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            queueStackView.topAnchor.constraint(equalTo: taskTimerLabel.bottomAnchor),
            queueStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            queueStackView.bottomAnchor.constraint(equalTo: screenStackView.bottomAnchor)
        ])

    }


}
