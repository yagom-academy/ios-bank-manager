//
//  BankManagerUIApp - BankManagerViewController.swift
//  Created by brody, christy, harry.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class BankManagerViewController: UIViewController {
    private let controlPanelStackView = ControlPanelStackView()
    private let customerQueueScrollView = CustomerQueueScrollView()
    private var bankManager = BankManager()
    private var customerGenerator = CustomerGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        addNotificationObservers()
    }
    
    private func configureView() {
        view.backgroundColor = .white
        
        controlPanelStackView.setControlButtonTarget(
            addAction: #selector(addCustomerButtonTapped),
            clearAction: #selector(clearButtonTapped)
        )
        
        configureControlPanelStackView()
        configureCustomerQueueScrollView()
    }
    
    private func addNotificationObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(moveCustomerLabel(_:)),
                                               name: .startJob,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(removeCustomerLabel(_:)),
                                               name: .finishJob,
                                               object: nil)
    }
    
    @objc
    private func moveCustomerLabel(_ noti: Notification) {
        guard let customer = noti.userInfo?[NotificationKey.customer] as? Customer else { return }
        
        customerQueueScrollView.moveToProcessingQueue(customer: customer)
    }
    
    @objc
    private func removeCustomerLabel(_ noti: Notification) {
        guard let customer = noti.userInfo?[NotificationKey.customer] as? Customer else { return }
        
        customerQueueScrollView.removeFromProcessingQueue(customer: customer)
    }
    
    private func configureControlPanelStackView() {
        view.addSubview(controlPanelStackView)
        controlPanelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            controlPanelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            controlPanelStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            controlPanelStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            controlPanelStackView.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.height / 6)
        ])
    }
    
    private func configureCustomerQueueScrollView() {
        view.addSubview(customerQueueScrollView)
        customerQueueScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customerQueueScrollView.topAnchor.constraint(equalTo: controlPanelStackView.bottomAnchor, constant: 15),
            customerQueueScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            customerQueueScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            customerQueueScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc
    private func addCustomerButtonTapped() {
        let customers = customerGenerator.make(numberOfCustomer: 10)
        
        bankManager.addTenCustomers(customers)
        customerQueueScrollView.addWaitingLabel(customers: customers)
        bankManager.startBusiness()
        bankManager.startTimer { [weak self] in
            self?.updateTimerLabel()
        }
    }
    
    @objc
    private func clearButtonTapped() {
        customerQueueScrollView.resetAllStackView()
        bankManager.stopAllTask()
        customerGenerator.reset()
        bankManager.endTimer()
        controlPanelStackView.resetTimerLabel()
    }
    
    private func updateTimerLabel() {
        controlPanelStackView.setTimerLabel()
    }
}
