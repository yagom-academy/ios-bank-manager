//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class BankManagerViewController: UIViewController {
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    private let waitingClientStackView: ClientStackView = .init()
    private let processingClientStackView: ClientStackView = .init()
    private let timerStackView: TimerStackView = .init()
    private let bankTimer: BankTimer = .init()
    private let bank: Bank = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addNotificationObserver()
        
        bankTimer.timeDisplayableDelegate = timerStackView
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        addMainStackView()
        addButton()
        addTimeStackView()
        addQueueLabel()
        addScrollView()
    }
    
    private func addNotificationObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(startBankBusiness(notification:)),
            name: Notification.Name(Event.startBankBusiness),
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(endBankBusiness(notification:)),
            name: Notification.Name(Event.endBankBusiness),
            object: nil
        )
    }
    
    private func addMainStackView() {
        view.addSubview(mainStackView)
        
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
        addClientButton.addTarget(self, action: #selector(touchUpAddClientButton), for: .touchUpInside)
        
        let resetButton: UIButton = .init()
        resetButton.setTitle("초기화", for: .normal)
        resetButton.setTitleColor(.systemRed, for: .normal)
        resetButton.addTarget(self, action: #selector(touchUpClearButton), for: .touchUpInside)
        
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
    
    private func addTimeStackView() {
        mainStackView.addArrangedSubview(timerStackView)
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
        waitingScrollView.addSubview(waitingClientStackView)
        waitingScrollView.translatesAutoresizingMaskIntoConstraints = false
        waitingScrollView.contentLayoutGuide.widthAnchor.constraint(lessThanOrEqualTo: waitingScrollView.widthAnchor).isActive = true
        
        let businessScrollView: UIScrollView = .init()
        businessScrollView.addSubview(processingClientStackView)
        businessScrollView.translatesAutoresizingMaskIntoConstraints = false
        businessScrollView.contentLayoutGuide.widthAnchor.constraint(lessThanOrEqualTo: businessScrollView.widthAnchor).isActive = true
        
        let scrollStackView: UIStackView = .init()
        scrollStackView.axis = .horizontal
        scrollStackView.distribution = .fillEqually
        
        mainStackView.addArrangedSubview(scrollStackView)
        scrollStackView.addArrangedSubview(waitingScrollView)
        scrollStackView.addArrangedSubview(businessScrollView)
        
        setupStackViewAutoLayout(stackView: waitingClientStackView, equalTo: waitingScrollView)
        setupStackViewAutoLayout(stackView: processingClientStackView, equalTo: businessScrollView)
    }
    
    private func setupStackViewAutoLayout(stackView: UIStackView, equalTo view: UIView) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    private func add(client: BankClient, to clientStackView: ClientStackView) {
        let label: ClientLabel = .init(client)
        label.text = "\(client.waitingNumber)-\(client.business)"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24)
        
        switch client.business {
        case .loan:
            label.textColor = .systemPurple
        case .deposit:
            label.textColor = .black
        }
        
        clientStackView.addArrangedSubview(label)
    }
    
    private func remove(client: BankClient, from clientStackView: ClientStackView) {
        clientStackView.arrangedSubviews.forEach {
            if ($0 as? ClientLabel)?.client == client {
                $0.removeFromSuperview()
            }
        }
    }
    
    private func clear(clientStackView: ClientStackView) {
        clientStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    @objc private func startBankBusiness(notification: Notification) {
        guard let client = notification.object as? BankClient else { return }
        
        OperationQueue.main.addOperation { [self] in
            remove(client: client, from: waitingClientStackView)
            add(client: client, to: processingClientStackView)
        }
    }
    
    @objc private func endBankBusiness(notification: Notification) {
        guard let client = notification.object as? BankClient else { return }
        
        OperationQueue.main.addOperation { [self] in
            remove(client: client, from: processingClientStackView)
            
            if processingClientStackView.subviews.isEmpty &&
                waitingClientStackView.subviews.isEmpty  {
                bankTimer.stopTimer()
            }
        }
    }
    
    @objc private func touchUpAddClientButton() {
        for _ in 1...10 {
            guard let client = bank.makeClient() else { return }
            
            add(client: client, to: waitingClientStackView)
        }
        
        bank.startBankBusiness()
        bankTimer.startTimer()
    }
    
    @objc private func touchUpClearButton() {
        clear(clientStackView: waitingClientStackView)
        clear(clientStackView: processingClientStackView)
        bankTimer.clearTimer()
        
        NotificationCenter.default.post(name: NSNotification.Name(Event.touchUpResetButton), object: nil)
    }
}
