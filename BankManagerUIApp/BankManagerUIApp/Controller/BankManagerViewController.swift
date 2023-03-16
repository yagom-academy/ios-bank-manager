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
    private let bank: Bank = .init() // 싱글톤?
    private let totalTime: UILabel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainStackView()
        addButton()
        addTimeLabel()
        addQueueLabel()
        addScrollView()
        addNotificationObserver()
        
        bank.open()
    }
    
    private var timer = Timer()
    private var startTime: CFAbsoluteTime = .zero
    private var currentTime: CFAbsoluteTime = .zero
    private var previousTime: CFAbsoluteTime = .zero
    
    @objc func measureTime() {
        currentTime = CFAbsoluteTimeGetCurrent() - startTime + previousTime
        
        let milliseconds = Int(currentTime * 1000) % 1000
        let seconds = (Int(currentTime * 1000) / 1000) % 60
        let minutes = (Int(currentTime * 1000) / (1000 * 60)) % 60
        
        totalTime.text = String(format: "%02d:%02d:%03d", minutes, seconds, milliseconds)
    }
    
    func setTimer() {
        if timer.isValid { return }
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(measureTime), userInfo: nil, repeats: true)
        
        startTime = CFAbsoluteTimeGetCurrent()
        previousTime = currentTime
    }
    
    private func addNotificationObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(startProcess(notification:)),
            name: Notification.Name("startBankBusiness"),
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(endProcess(notification:)),
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
        resetButton.addTarget(self, action: #selector(resetClientAndTime), for: .touchUpInside)
        
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
        businessTime.text = "업무 시간 - "
        businessTime.textAlignment = .right
        businessTime.font = .systemFont(ofSize: 24)
        
        totalTime.text = "00:00:000"
        totalTime.textAlignment = .left
        totalTime.font = .systemFont(ofSize: 24)
    
        let timeStackView: UIStackView = .init()
        timeStackView.axis = .horizontal
        timeStackView.distribution = .fillEqually
        timeStackView.spacing = 8
        
        timeStackView.addArrangedSubview(businessTime)
        timeStackView.addArrangedSubview(totalTime)
        
        mainStackView.addArrangedSubview(timeStackView)
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
    
    @objc func startProcess(notification: Notification) {
        guard let client = notification.object as? BankClient else { return }
        
        DispatchQueue.main.async {
            self.waitingClientStackView.remove(client: client)
            self.processingClientStackView.add(client: client)
        }
    }
    
    @objc func endProcess(notification: Notification) {
        guard let client = notification.object as? BankClient else { return }
        
        DispatchQueue.main.async {
            self.processingClientStackView.remove(client: client)
            
            if self.processingClientStackView.subviews.isEmpty &&
                self.waitingClientStackView.subviews.isEmpty  {
                self.timer.invalidate()
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
        setTimer()
    }
    
    @objc func resetClientAndTime() {
        waitingClientStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        processingClientStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        totalTime.text = "00:00:000"
        timer.invalidate()
        previousTime = .zero
        currentTime = .zero
        NotificationCenter.default.post(name: NSNotification.Name("touchUpResetButton"), object: nil)
        
        processingClientStackView.stopDrawingUI()
    }
}

