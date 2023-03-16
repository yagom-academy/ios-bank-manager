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
        addQueueLabel()
        addScrollView()
    }
    
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.spacing = 12
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
        addClientButton.setTitle("고객 10명 추가", for: .normal)
        addClientButton.setTitleColor(.systemBlue, for: .normal)
        
        let resetButton: UIButton = .init()
        resetButton.setTitle("초기화", for: .normal)
        resetButton.setTitleColor(.systemRed, for: .normal)
        
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
        businessTime.font = .systemFont(ofSize: 24)
        
        businessTime.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 20)
        
        
        mainStackView.addArrangedSubview(businessTime)
        
        businessTime.translatesAutoresizingMaskIntoConstraints = false
        businessTime.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    private func addQueueLabel() {
        let waitingQueue: UILabel = .init()
        waitingQueue.text = "대기중"
        waitingQueue.textAlignment = .center
        waitingQueue.backgroundColor = .systemGreen
        waitingQueue.textColor = .white
        waitingQueue.font = .systemFont(ofSize: 32)
        
        let businessQueue: UILabel = .init()
        businessQueue.text = "업무중"
        businessQueue.textAlignment = .center
        businessQueue.backgroundColor = .systemIndigo
        businessQueue.textColor = .white
        businessQueue.font = .systemFont(ofSize: 32)
        
        let queueStackView: UIStackView = .init()
        queueStackView.axis = .horizontal
        queueStackView.distribution = .fillEqually
        
        mainStackView.addArrangedSubview(queueStackView)
        queueStackView.addArrangedSubview(waitingQueue)
        queueStackView.addArrangedSubview(businessQueue)
    }
    
    private func addScrollView() {
        let waitingScrollView: UIScrollView = .init()
        waitingScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let businessScrollView: UIScrollView = .init()
        businessScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let scrollStackView: UIStackView = .init()
        scrollStackView.axis = .horizontal
        scrollStackView.distribution = .fillEqually
        
        mainStackView.addArrangedSubview(scrollStackView)
        scrollStackView.addArrangedSubview(waitingScrollView)
        scrollStackView.addArrangedSubview(businessScrollView)
        
        let waitingStackView: UIStackView = .init()
        waitingStackView.axis = .vertical
        waitingStackView.alignment = .center
        waitingStackView.distribution = .fillEqually
        
        let businessStackView: UIStackView = .init()
        businessStackView.axis = .vertical
        
        waitingScrollView.addSubview(waitingStackView)
        businessScrollView.addSubview(businessStackView)
        
        waitingStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            waitingStackView.leadingAnchor.constraint(equalTo: waitingScrollView.leadingAnchor),
            waitingStackView.trailingAnchor.constraint(equalTo: waitingScrollView.trailingAnchor),
            waitingStackView.bottomAnchor.constraint(equalTo: waitingScrollView.bottomAnchor),
            waitingStackView.topAnchor.constraint(equalTo: waitingScrollView.topAnchor)
        ])
        
        businessStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            businessStackView.leadingAnchor.constraint(equalTo: businessScrollView.leadingAnchor),
            businessStackView.trailingAnchor.constraint(equalTo: businessScrollView.trailingAnchor),
            businessStackView.bottomAnchor.constraint(equalTo: businessScrollView.bottomAnchor),
            businessStackView.topAnchor.constraint(equalTo: businessScrollView.topAnchor)
        ])
        
        let clientLabel: UILabel = .init()
        clientLabel.text = "5-예금"
        clientLabel.textAlignment = .center
        clientLabel.font = .systemFont(ofSize: 24)
        
        let clientLabel2: UILabel = .init()
        clientLabel2.text = "8-예금"
        clientLabel2.textAlignment = .center
        clientLabel2.font = .systemFont(ofSize: 24)
        
        waitingStackView.addArrangedSubview(clientLabel)
        waitingStackView.addArrangedSubview(clientLabel2)
        
        let clientLabel3: UILabel = .init()
        clientLabel3.text = "11-예금"
        clientLabel3.textAlignment = .center
        clientLabel3.font = .systemFont(ofSize: 24)
        
        businessStackView.addArrangedSubview(clientLabel3)
    }
}

