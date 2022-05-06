//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    private lazy var bankView = BankView(frame: view.bounds)
    private var bank = Bank()
    private var timer = Timer()
    private var counter = 0
    private var seconds = 0
    private var minutes = 0
    private var isPlay = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = bankView
        updateTimeLabel()
        setButtons()
        bank.delegate = self
    }
    
    private func updateTimeLabel() {
        bankView.timerLabel.text = "업무시간 - \(String(format: "%.2d", minutes)):\(String(format: "%.2d", seconds)):\(String(format: "%.3d", counter))"
    }
    
    private func setButtons() {
        bankView.addCustomerButton.addTarget(self, action: #selector(addCustomer), for: .touchUpInside)
        bankView.resetButton.addTarget(self, action: #selector(setInitialState), for: .touchUpInside)
    }
    
    @objc private func addCustomer() {
        bank.openBank()
    }
    
    @objc private func setInitialState() {
        bankView.waitingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        bankView.taskingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        bank.clearCustomerQueue()
        resetTimer()
    }
    
    private func resetTimer() {
        counter = 0
        seconds = 0
        minutes = 0
        updateTimeLabel()
        isPlay = false
        timer.invalidate()
    }
    
    private func startTimer() {
        if isPlay { return }
        isPlay = true
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTime() {
        if counter == 1000 {
            seconds += 1
            counter = 0
        }
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        self.counter += 1
        updateTimeLabel()
    }
}

extension ViewController: BankDelegate {
    func customerLabel(customer: Customer) -> UILabel {
        let label = UILabel()
         label.textAlignment = .center
         label.font = UIFont.preferredFont(forTextStyle: .title3)
         if customer.task == .loan {
             label.textColor = .systemPurple
         }
         label.text = "\(customer.number) - \(customer.task.title)"
         return label
    }
    
    func sendAddedCustomer(customer: Customer) {
        bankView.waitingStackView.addArrangedSubview(customerLabel(customer: customer))
    }
    
    func sendTaskingCustomer(customer: Customer) {
        DispatchQueue.main.async {
            self.startTimer()
            self.bankView.waitingStackView.arrangedSubviews.forEach {
                let label = $0 as? UILabel
                if label?.text == "\(customer.number) - \(customer.task.title)" {
                    $0.removeFromSuperview()
                    self.bankView.taskingStackView.addArrangedSubview($0)
                }
            }
        }
    }
    
    func sendEndCustomer(customer: Customer) {
        DispatchQueue.main.async {
            self.bankView.taskingStackView.arrangedSubviews.forEach {
                let label = $0 as? UILabel
                if label?.text == "\(customer.number) - \(customer.task.title)" {
                    $0.removeFromSuperview()
                }
            }
            if self.bankView.taskingStackView.arrangedSubviews.isEmpty {
                self.isPlay = false
                self.timer.invalidate()
            }
        }
    }
}
