//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class BankManagerViewController: UIViewController {
    private let mainStackView: UIStackView = .init()
    private let waitingClientStackView: ClientStackView = .init()
    private let processingClientStackView: ClientStackView = .init()
    
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
        
        waitingScrollView.addSubview(waitingClientStackView)
        businessScrollView.addSubview(processingClientStackView)
        //        let waitingStackView: UIStackView = .init()
        //        waitingStackView.axis = .vertical
        //        waitingStackView.spacing = 8
        //        waitingStackView.alignment = .center
        //        waitingStackView.distribution = .fillEqually
        //
        //        let businessStackView: UIStackView = .init()
        //        businessStackView.axis = .vertical
        
        
        let waitingStackView: UIStackView = .init()
        waitingStackView.axis = .vertical
        waitingStackView.spacing = 8
        waitingStackView.alignment = .center
        waitingStackView.distribution = .fillEqually
        
        let businessStackView: UIStackView = .init()
        businessStackView.axis = .vertical
        
        waitingScrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: waitingScrollView.frameLayoutGuide.widthAnchor, constant: -1).isActive = true
        businessScrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: businessScrollView.frameLayoutGuide.widthAnchor, constant: -1).isActive = true
        
        waitingClientStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            waitingClientStackView.leadingAnchor.constraint(equalTo: waitingScrollView.leadingAnchor),
            waitingClientStackView.trailingAnchor.constraint(equalTo: waitingScrollView.trailingAnchor),
            waitingClientStackView.bottomAnchor.constraint(equalTo: waitingScrollView.bottomAnchor),
            waitingClientStackView.topAnchor.constraint(equalTo: waitingScrollView.topAnchor),
            waitingClientStackView.widthAnchor.constraint(equalTo: waitingScrollView.widthAnchor)
            
        ])
        
        processingClientStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            processingClientStackView.leadingAnchor.constraint(equalTo: businessScrollView.leadingAnchor),
            processingClientStackView.trailingAnchor.constraint(equalTo: businessScrollView.trailingAnchor),
            processingClientStackView.bottomAnchor.constraint(equalTo: businessScrollView.bottomAnchor),
            processingClientStackView.topAnchor.constraint(equalTo: businessScrollView.topAnchor),
            processingClientStackView.widthAnchor.constraint(equalTo: businessScrollView.widthAnchor)
            
        ])
        
        for index in 1...30 {
            let label: UILabel = .init()
            label.text = "\(index)-예금"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 24)
            
            waitingClientStackView.addArrangedSubview(label)
        }
        
        for index in 1...40 {
            let label: UILabel = .init()
            label.text = "\(index)-예금"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 24)
            
            processingClientStackView.addArrangedSubview(label)
        }
    }
}

