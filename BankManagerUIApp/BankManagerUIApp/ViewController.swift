//
//  BankManagerUIApp - ViewController.swift
//  Created by OneTool, Red
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

extension Notification.Name {
    static let customerAlram = Notification.Name("customerAlram")
    static let addCustomerAlram = Notification.Name("addCustomerAlram")
    static let removeCustomerAlram = Notification.Name("removeCustomerAlram")
    static let timer = Notification.Name("timer")
}

class ViewController: UIViewController {
    var bankManager = BankManager()
    private lazy var mainView = MainView(frame: view.frame)
    var timer: Timer?
    var time: Double = 0 {
        didSet {
            mainView.workingTimeLabel.text = String(time)
        }
    }
    
    override func viewDidLoad() {
        self.view = mainView
        
        NotificationCenter.default.addObserver(self, selector: #selector(addSeperateCustomerLabel), name: .addCustomerAlram, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moveCustomerLabel), name: .customerAlram, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(removeCustomerLabel), name: .removeCustomerAlram, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(stopTimer), name: .timer, object: nil)
        
        bind()
        bankManager = BankManager()
        createTimer()
        bankManager.openBank()
    }
    
    @objc func addSeperateCustomerLabel(notification: Notification) {
        guard let customer = notification.userInfo?["oneCustomer"] as? Customer else { return }
        mainView.watingStackView.addArrangedSubview(mainView.createCustomerLabel(customer: customer))
    }
    
    @objc private func moveCustomerLabel(notification: Notification) {
        DispatchQueue.main.async { [weak self] in
            guard let numberTicket = notification.userInfo?["customerNumberTicekt"] as? Int else { return }
            guard let subviews = self?.mainView.watingStackView.arrangedSubviews as? [UILabel] else { return }
            guard let targetLabel = subviews.filter({ label in
                guard let labelText = label.text?.components(separatedBy: " ").first else { return false }
                return labelText == String(numberTicket)
            }).first else { return }
            
            targetLabel.removeFromSuperview()
            
            self?.mainView.workingStackView.addArrangedSubview(targetLabel)
        }
    }
    
    @objc private func removeCustomerLabel(notification: Notification) {
        DispatchQueue.main.async { [weak self] in
            guard let numberTicket = notification.userInfo?["customerNumberTicekt"] as? Int else { return }
            guard let subviews = self?.mainView.workingStackView.arrangedSubviews as? [UILabel] else { return }
            guard let targetLabel = subviews.filter({ label in
                guard let labelText = label.text?.components(separatedBy: " ").first else { return false }
                return labelText == String(numberTicket)
            }).first else { return }
            
            targetLabel.removeFromSuperview()
        }
    }
    
    @objc private func addMilliseconds() {
        time += 0.001
    }
    
    @objc private func stopTimer(notification: Notification) {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func addCustomer() {
        bankManager.bank.addTenCustomer()
        createTimer()
    }
    
    @objc func resetAll() {
        mainView.watingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        mainView.workingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        timer?.invalidate()
        time = 0
        timer = nil
        bankManager.bank.resetAll()
    }
    
    private func createTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(addMilliseconds), userInfo: nil, repeats: true)
        }
    }
    
    private func bind() {
        mainView.addTenCustomerButton.addTarget(self, action: #selector(addCustomer), for: .touchUpInside)
        mainView.resetButton.addTarget(self, action: #selector(resetAll), for: .touchUpInside)
    }
}


