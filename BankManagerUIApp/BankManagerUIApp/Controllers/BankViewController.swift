//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class BankViewController: UIViewController {
    private let clientAddButton: UIButton = {
        var button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.addTarget(nil, action: #selector(addClientButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let clearButton: UIButton = {
        var button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.addTarget(nil, action: #selector(clearButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let bankView = BankView()
    private let bank: Bank<ClientQueue>
    private var timer: Timer?
    private var timeCount: Double = .zero
    private var isFirstTap: Bool = true
    private let timerFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss:SSS"
        return formatter
    }()
    
    init() {
        let banker: Banker = Banker()
        let clientQueue: ClientQueue = ClientQueue()
        let bankManager: BankManager = BankManager()
        
        bank = Bank(banker: banker, queue: clientQueue, bankManager: bankManager)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = bankView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNotification()
        addButton()
    }
    
    private func addNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handlingStackView),
                                               name: .client,
                                               object: nil)
    }
    
    private func addButton() {
        bankView.buttonStackView.addArrangedSubview(clientAddButton)
        bankView.buttonStackView.addArrangedSubview(clearButton)
    }
    
    @objc func addClientButtonTapped() {
        if isFirstTap {
            makeTimer()
            isFirstTap = false
        }
        
        for _ in 1...10 {
            if let client = bank.updateClientQueue() {
                let clientLabel = ClientLabel(client: client)
                bankView.waitingStackView.addArrangedSubview(clientLabel)
            }
        }
        bank.startBankWork()
    }
    
    @objc func clearButtonTapped() {
        bank.resetAll()
        bankView.workingStackView.removeAllArrangedSubviews()
        bankView.waitingStackView.removeAllArrangedSubviews()
        resetTimer()
    }
    
    @objc func handlingStackView(notification: Notification) {
        guard let workState = notification.userInfo?["WorkState"] as? WorkState else { return }
        
        switch workState {
        case .start:
            handleLabel(by: bankView.waitingStackView, notification: notification)
        case .done:
            handleLabel(by: bankView.workingStackView, notification: notification)
        }
    }
    
    private func handleLabel(by stackView: UIStackView, notification: Notification) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self,
                  let client = notification.object as? Client else { return }
            let ticketNumber = client.waitingTicket
            
            guard let labels = stackView.arrangedSubviews as? [ClientLabel],
                  let targetLabel = labels.filter({ $0.client.waitingTicket == ticketNumber }).first
            else { return }
            
            targetLabel.removeFromSuperview()
            
            if stackView == self.bankView.waitingStackView {
                self.addToWorkingStackView(targetLabel)
            }
            
            self.pauseTimer()
        }
    }
    
    private func addToWorkingStackView(_ label: UILabel) {
        bankView.workingStackView.addArrangedSubview(label)
    }
}

// MARK: - Timer
extension BankViewController {
    private func makeTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) {_ in
            DispatchQueue.global().async { [weak self] in
                guard let self = self else { return }
                
                self.timeCount += 0.001
                let time = self.makeTimeLabel(count: self.timeCount)
                DispatchQueue.main.async {
                    self.bankView.timeLabel.text = "업무시간 - \(time)"
                }
            }
        }
        timer?.tolerance = 0.0001
    }
    
    private func makeTimeLabel(count: Double) -> String {
        let date = Date(timeIntervalSince1970: count)
        return timerFormatter.string(from: date)
    }
    
    private func pauseTimer() {
        if bankView.workingStackView.arrangedSubviews.isEmpty,
           bankView.waitingStackView.arrangedSubviews.isEmpty {
            timer?.invalidate()
            isFirstTap = true
        }
    }
    
    private func resetTimer() {
        timer?.invalidate()
        isFirstTap = true
        timeCount = .zero
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
            self.bankView.timeLabel.text = "업무시간 - 00:00:000"
        }
    }
}
