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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @objc private func moveCustomerLabel(_ noti: Notification) {
        
    }
    
    @objc private func removeCustomerLabel(_ noti: Notification) {
        
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
    
    @objc func addCustomerButtonTapped() {
        let customers = CustomerGenerator.make(numberOfCustomer: 10)
        
        bankManager.addTenCustomers(customers)
        customerQueueScrollView.addWaitingLabel(customers: customers)
        bankManager.startBusiness()
    }
    
    @objc func clearButtonTapped() {
        print("clear")
    }
}

//extension BankManagerViewController: CustomerQueueDelegate {
//    func addLabels(customers: [Customer]) {
//        <#code#>
//    }
//}
