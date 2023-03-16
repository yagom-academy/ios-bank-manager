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
    private let timerStackView: TimerStackView = .init()
    private let bank: Bank = .init() // 싱글톤?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainStackView()
        addButton()
        addTimeStackView()
        addQueueLabel()
        addScrollView()
        addNotificationObserver()
        
        bank.open()
    }
    
    private func addNotificationObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(startBankBusiness(notification:)),
            name: Notification.Name("startBankBusiness"),
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(endBankBusiness(notification:)),
            name: Notification.Name("endBankBusiness"),
            object: nil
        )
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
        
        waitingClientStackView.setAutoLayout()
        processingClientStackView.setAutoLayout()
    }
    
    @objc func startBankBusiness(notification: Notification) {
        guard let client = notification.object as? BankClient else { return }
        
        OperationQueue.main.addOperation {
            self.waitingClientStackView.remove(client: client)
            self.processingClientStackView.add(client: client)
        }
    }
    
    @objc func endBankBusiness(notification: Notification) {
        guard let client = notification.object as? BankClient else { return }
        
        OperationQueue.main.addOperation {
            self.processingClientStackView.remove(client: client)
            
            if self.processingClientStackView.subviews.isEmpty &&
                self.waitingClientStackView.subviews.isEmpty  {
                self.timerStackView.stopTimer()
            }
        }
    }
    
    @objc func touchUpAddClientButton() {
        processingClientStackView.startDrawingUI()
        
        for _ in 1...10 {
            guard let client = bank.makeClient() else { return }
            
            waitingClientStackView.add(client: client)
        }
        
        bank.processBusiness()
        timerStackView.startTimer()
    }
    
    @objc func touchUpClearButton() {
        waitingClientStackView.clear()
        processingClientStackView.clear()
        timerStackView.clearTimer()
        
        NotificationCenter.default.post(name: NSNotification.Name("touchUpResetButton"), object: nil)
        
        processingClientStackView.stopDrawingUI()
    }
}
