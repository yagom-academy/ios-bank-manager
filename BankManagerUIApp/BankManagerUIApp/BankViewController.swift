//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class BankViewController: UIViewController {

    private let clientAddButton: UIButton = {
        var button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addClient), for: .touchUpInside)
        return button
    }()
    
    private let clearButton: UIButton = {
        var button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(resetData), for: .touchUpInside)
        return button
    }()
    
    private let buttonStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let timeLabel: UILabel = {
        var label = UILabel()
        label.text = "업무시간 - \(Date())"
        label.font = .preferredFont(forTextStyle: .title3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let topStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTopStackView()
    }
    
    @objc func addClient() {
        
    }
    
    @objc func resetData() {
        
    }
}

extension BankViewController {
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupTopStackView() {
        buttonStackView.addArrangedSubview(clientAddButton)
        buttonStackView.addArrangedSubview(clearButton)
        topStackView.addArrangedSubview(buttonStackView)
        topStackView.addArrangedSubview(timeLabel)
        
        view.addSubview(topStackView)
        setupTopStackViewConstraint()
    }
    
    private func setupTopStackViewConstraint() {
        NSLayoutConstraint.activate([
            buttonStackView.widthAnchor.constraint(equalTo: topStackView.widthAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 40),
            
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topStackView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}

