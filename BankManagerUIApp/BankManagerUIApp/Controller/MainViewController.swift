//
//  BankManagerUIApp - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    private let mainStackView: MainStackView = MainStackView()
    private let buttonStackView: ButtonStackView = ButtonStackView()
    private let bankStateStackView: BankStateStackView = BankStateStackView()
    private let customerQueueStackView: CustomerQueueStackView = CustomerQueueStackView()
    private let stopWatchLabel: StopWatchLabel = StopWatchLabel()
    
    private var stopWatch: StopWatch = StopWatch()
    private var bankManager: BankManager = BankManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setSubView()
        setConstraints()
        setNotificationObserver()
        setButtonTarget()
        stopWatch.stopWatchDelegate = self
        bankManager.customerSettingDelegate = self
    }
    
    private func setSubView() {
        mainStackView.addArrangedSubview(buttonStackView)
        mainStackView.addArrangedSubview(stopWatchLabel)
        mainStackView.addArrangedSubview(bankStateStackView)
        mainStackView.addArrangedSubview(customerQueueStackView)
        view.addSubview(mainStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.075),
            stopWatchLabel.heightAnchor.constraint(equalTo: buttonStackView.heightAnchor),
            bankStateStackView.heightAnchor.constraint(equalTo: buttonStackView.heightAnchor)
        ])
    }
    
    private func setNotificationObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didReceiveStartWork),
                                               name: .startWork,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didReceiveCompleteWork),
                                               name: .completeWork,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didReceiveCompleteBankingService),
                                               name: .completeBankingSevice,
                                               object: nil)
    }
    
    private func setButtonTarget() {
        buttonStackView.addButton.addTarget(self,
                                            action: #selector(tappedAddButton),
                                            for: .touchUpInside)
        buttonStackView.resetButton.addTarget(self,
                                              action: #selector(tappedResetButton),
                                              for: .touchUpInside)
    }
    
// MARK: - Button Target Method
    @objc
    func tappedAddButton() {
        DispatchQueue.global().async { [self] in
            bankManager.addTenCustomers()
            bankManager.startWork()
        }
        stopWatch.start()
    }
    
    @objc
    func tappedResetButton() {
        stopWatch.cancel()
        bankManager.reset()
        customerQueueStackView.reset()
    }
    
// MARK: - Notification Observer Method
    @objc
    func didReceiveStartWork(_ notification: Notification) {
        guard let waitingNumber: Int = notification.object as? Int else {
            return
        }
        
        customerQueueStackView.removeWaitingCustomerLabel(of: waitingNumber)
    }
    
    @objc
    func didReceiveCompleteWork(_ notification: Notification) {
        guard let waitingNumber: Int = notification.object as? Int else {
            return
        }
        
        customerQueueStackView.removeWorkingCustomerLabel(of: waitingNumber)
    }
    
    @objc
    func didReceiveCompleteBankingService() {
        stopWatch.pause()
    }
}

// MARK: - MainViewController Extension CustomerSettingDelegate
extension MainViewController: CustomerSettingDelegate {
    func complete(_ customers: [Customer]) {
        customerQueueStackView.addWaitingCustomers(customers)
    }
}

// MARK: - MainViewController Extension StopWatchDelegate
extension MainViewController: StopWatchDelegate {
    func reset() {
        stopWatchLabel.reset()
    }
    
    func addOneMilliSecond() {
        stopWatchLabel.addOneMilliSecond()
    }
}
