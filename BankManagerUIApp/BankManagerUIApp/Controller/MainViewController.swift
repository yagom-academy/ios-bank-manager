//
//  BankManagerUIApp - ViewController.swift
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
        setSubView()
        setConstraints()
    }
    
    func configure() {
        buttonStackView.addButton.addTarget(self,
                                            action: #selector(tappedAddButton),
                                            for: .touchUpInside)
        buttonStackView.resetButton.addTarget(self,
                                              action: #selector(tappedResetButton),
                                              for: .touchUpInside)
        stopWatch.setDelegate(to: stopWatchLabel)
        bankManager.setDelegate(of: self)
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
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
    @objc
    func tappedAddButton() {
        DispatchQueue.global().async { [self] in
            bankManager.addTenCustomers()
        }
        stopWatch.start()
    }
    
    @objc
    func tappedResetButton() {
        stopWatch.cancel()
        bankManager.reset()
        customerQueueStackView.reset()
    }
}

extension MainViewController: CustomerSettingDelegate {
    func complete(_ customers: [Customer]) {
        customerQueueStackView.addWaitingCustomers(customers)
    }
}
