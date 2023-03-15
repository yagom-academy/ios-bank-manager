//
//  BankManagerUIApp - BankViewController.swift
//  Created by kaki, songjun. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class BankViewController: UIViewController {
    private lazy var bankView = BankView(frame: view.bounds)
    private var bankManager = BankManager()
    private var timeCount: Double = .zero
    private var timer = Timer()
    private var isPlay = false
    private let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss:SSS"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bankManager.delegate = self
        view = bankView
        updateTimeLabel()
        setupButton()
    }
    
    private func updateTimeLabel() {
        let date = Date(timeIntervalSince1970: timeCount)
        let time = timeFormatter.string(from: date)
        bankView.timeLabel.text = "업무시간 - \(time)"
    }
    
    private func setupButton() {
        bankView.addClientButton.addTarget(self, action: #selector(pushAddClientButton), for: .touchUpInside)
        bankView.resetButton.addTarget(self, action: #selector(pushResetButton), for: .touchUpInside)
    }
    
    @objc private func pushAddClientButton() {
        bankManager.setupWaitingQueueAndClientNumber()
        bankManager.processBusiness()
    }
    
    @objc private func pushResetButton() {
        bankView.waitClientStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        bankView.processClientStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        bankManager.reset()
        resetTimer()
    }
    
    private func startTimer() {
        if isPlay { return }
        isPlay = true
        timer = .scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        timeCount += 0.001
        updateTimeLabel()
    }
    
    private func resetTimer() {
        timeCount = .zero
        updateTimeLabel()
        isPlay = false
        timer.invalidate()
    }
}

extension BankViewController: BankManagerDelegate {
    private func setClientLabel(_ client: Client) -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        if client.requstedTask == .loan {
            label.textColor = .systemPurple
        }
        
        label.text = "\(client.clientNumber) - \(client.requstedTask.taskName)"
        
        return label
    }
    
    func sendClient(_ client: Client) {
        bankView.waitClientStackView.addArrangedSubview(setClientLabel(client))
    }
    
    func startClientTask(_ client: Client) {
        DispatchQueue.main.async {
            self.startTimer()
            self.bankView.waitClientStackView.arrangedSubviews.forEach {
                let label = $0 as? UILabel
                if label?.text == "\(client.clientNumber) - \(client.requstedTask.taskName)" {
                    $0.removeFromSuperview()
                    self.bankView.processClientStackView.addArrangedSubview($0)
                }
            }
        }
    }
    
    func endClientTask(_ client: Client) {
        DispatchQueue.main.async {
            self.bankView.processClientStackView.arrangedSubviews.forEach {
                let label = $0 as? UILabel
                if label?.text == "\(client.clientNumber) - \(client.requstedTask.taskName)" {
                    $0.removeFromSuperview()
                }
            }
            if self.bankView.processClientStackView.arrangedSubviews.isEmpty {
                self.isPlay = false
                self.timer.invalidate()
            }
        }
    }
}
