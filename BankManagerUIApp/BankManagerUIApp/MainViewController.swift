//
//  BankManagerUIApp - ViewController.swift
//  Created by 레옹아범, 혜모리. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    private let addCustomerButton = CustomButton(type: .system)
    private let resetButton = CustomButton(type: .system)
    private let mainStackView = UIStackView()
    private let waitingStackView = UIStackView()
    private let workingStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureStackView()
        configureLayout()
        configureUI()
    }

    private func configureLayout() {
        createButtonStackView()
        createWorkTimeLabel()
        
        createWaitingTitleLabel()
        createWorkingTitleLabel()
    }
    
    private func configureUI() {
        addCustomerButton.setTitle("고객 10명 추가", for: .normal)
        resetButton.setTitle("초기화", for: .normal)
        resetButton.setTitleColor(.red, for: .normal)
    }
}

// MARK: - UIStackView
extension MainViewController {
    private func configureStackView() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.alignment = .center
        mainStackView.spacing = 16
        
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func createButtonStackView() {
        let stackView = UIStackView(arrangedSubviews: [addCustomerButton, resetButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually

        mainStackView.addArrangedSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
        ])
    }
    
    private func createWaitingLabelStackView() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 4
        
        stackView.addArrangedSubview(addWaitingLabel())
        waitingStackView.addArrangedSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
        ])
    }
}

// MARK: - UILabel
extension MainViewController {
    private func createWorkTimeLabel() {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = false
        label.text = "업무시간 - 04:00:123"
        label.font = .preferredFont(forTextStyle: .title2)
        label.numberOfLines = 1
        
        mainStackView.addArrangedSubview(label)
    }
    
    private func createWaitingTitleLabel() {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = false
        label.text = "대기중"
        label.font = .preferredFont(forTextStyle: .title1)
        label.numberOfLines = 1
        label.textColor = .white
        label.backgroundColor = .systemGreen
        
        waitingStackView.addArrangedSubview(label)
    }
    
    private func addWaitingLabel() -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = false
        label.text = "1 - 예금"
        label.font = .preferredFont(forTextStyle: .title2)
        label.numberOfLines = 1
        
        waitingStackView.addArrangedSubview(label)
        
        return label
    }
    
    private func createWorkingTitleLabel() {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = false
        label.text = "업무중"
        label.font = .preferredFont(forTextStyle: .title1)
        label.numberOfLines = 1
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        
        workingStackView.addArrangedSubview(label)
    }
}
