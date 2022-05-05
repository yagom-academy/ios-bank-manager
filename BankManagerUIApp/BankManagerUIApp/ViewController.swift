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
    
    let labelHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let taskQueueHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let waitingVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let workingVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
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
    
    let workTimeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "업무시간 - "
        label.textAlignment = .center
        
        return label
    }()
    
    let waitingLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "대기중"
        label.textColor = .white
        label.backgroundColor = .systemGreen
        label.textAlignment = .center
        
        return label
    }()
    
    let workingLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "업무중"
        label.textColor = .white
        label.backgroundColor = .systemBlue
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(baseVerticalStackView)
        
        // Buttons
        buttonHorizontalStackView.addArrangedSubview(addCustomerButton)
        buttonHorizontalStackView.addArrangedSubview(clearButton)
        labelHorizontalStackView.addArrangedSubview(waitingLabel)
        labelHorizontalStackView.addArrangedSubview(workingLabel)
        
        baseVerticalStackView.addArrangedSubview(buttonHorizontalStackView)
        baseVerticalStackView.addArrangedSubview(workTimeLabel)
        baseVerticalStackView.addArrangedSubview(labelHorizontalStackView)
        
        baseVerticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        baseVerticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        baseVerticalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        baseVerticalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        baseVerticalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
    }
}

