//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    let mainStackView: MainStackView = MainStackView()
    var stopWatch: StopWatch = StopWatch()
    var bankManager: BankManager = BankManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        view.addSubview(mainStackView)
        mainStackView.setConstraints(from: self.view)
        mainStackView.buttonStackView.addButton.addTarget(self,
                                                          action: #selector(tappedAddButton),
                                                          for: .touchUpInside)
        mainStackView.buttonStackView.resetButton.addTarget(self,
                                                            action: #selector(tappedResetButton),
                                                            for: .touchUpInside)
        stopWatch.setDelegate(to: mainStackView.stopWatchLabel)
        bankManager.setDelegate(of: self)
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
    }
}

extension MainViewController: CustomerSettingDelegate {
    func complete(_ customers: [Customer]) {
        mainStackView.customerQueueStackView.addWaitingCustomers(customers)
    }
}
