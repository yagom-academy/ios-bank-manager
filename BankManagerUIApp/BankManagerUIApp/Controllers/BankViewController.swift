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
        button.addTarget(nil, action: #selector(addClient), for: .touchUpInside)
        return button
    }()
    
    private let clearButton: UIButton = {
        var button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.addTarget(nil, action: #selector(resetData), for: .touchUpInside)
        return button
    }()
    
    private lazy var bankView = BankView()
    
    private let banker: Banker = Banker()
    private var clientQueue: ClientQueue = ClientQueue()
    private var bankManager: BankManager = BankManager()
    
    private lazy var bank: Bank = Bank(banker: banker, queue: clientQueue, bankManager: bankManager)
    
    private var timer: Timer?
    private var timeCount: Double = .zero
    private let timerFormatter = DateFormatter()
    private var isFirstTap: Bool = true
    
    override func loadView() {
        self.view = bankView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNotification()
        addButton()
        
        timerFormatter.dateFormat = "mm:ss:SSS"
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
    
    @objc func addClient() {
        if isFirstTap {
            makeTimer()
            isFirstTap = false
        }
        
        for _ in 1...10 {
            if let client = bank.updateClientQueue() {
                bankView.waitingStackView.addArrangedSubview(makeClientLabel(client))
            }
        }
        bank.startBankWork()
    }
    
    @objc func resetData() {
        bank.resetAll()
        bankView.workingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        bankView.waitingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        resetTimer()
    }
    
    private func makeClientLabel(_ client: Client) -> UILabel {
        let label = UILabel()
        label.tag = client.waitingTicket
        label.text = "\(client.waitingTicket) - \(client.purpose.name)"
        label.textColor = client.purpose == .deposit ? .black : .systemPurple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    @objc func handlingStackView(noti: Notification) {
        guard let workState = noti.userInfo?["WorkState"] as? WorkState else { return }
        
        switch workState {
        case .start:
            handleLabel(by: bankView.waitingStackView, noti: noti)
        case .done:
            handleLabel(by: bankView.workingStackView, noti: noti)
        }
    }
    
    private func handleLabel(by stackView: UIStackView, noti: Notification) {
        DispatchQueue.main.async { [weak self] in
            guard let client = noti.object as? Client else { return }
            let ticketNumber = client.waitingTicket
            
            guard let labels = stackView.arrangedSubviews as? [UILabel],
                  let targetLabel = labels.filter({ $0.tag == ticketNumber }).first else { return }
            
            targetLabel.removeFromSuperview()
            
            if stackView == self?.bankView.waitingStackView {
                self?.addToWorkingStackView(targetLabel)
            }
            
            self?.pauseTimer(self)
        }
    }
    
    private func addToWorkingStackView(_ label: UILabel) {
        bankView.workingStackView.addArrangedSubview(label)
    }
}

// MARK: - Timer
extension BankViewController {
    private func makeTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
            DispatchQueue.global().async {
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
    
    private func pauseTimer(_ self: BankViewController?) {
        guard let self = self else { return }
        
        if self.bankView.workingStackView.arrangedSubviews.isEmpty,
           self.bankView.waitingStackView.arrangedSubviews.isEmpty {
            self.timer?.invalidate()
            self.isFirstTap = true
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
