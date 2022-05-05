//
//  BankManagerUIApp - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

fileprivate extension Constants {
    static let storyboardName = "Main"
}

final class MainViewController: UIViewController {
    private var bank: Bank?
    private lazy var mainView = MainView(frame: view.bounds)
    
    static func instance(bank: Bank) -> MainViewController {
        let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: nil)
        
        guard let mainViewController = storyboard.instantiateViewController(withIdentifier: identifier) as? MainViewController else {
            return MainViewController()
        }
        
        mainViewController.bank = bank
        return mainViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        setUpNotificationCenter()
        setUpButtonAction()
        bank?.bankTimer.delegate = self
        bank?.open()
    }

    private func setUpNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(addClientToStackView), name: .didRecieveClient, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateClientStackView), name: .didAssignClientToBankClerk, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(deleteClientStackView), name: .didFinishWork, object: nil)
    }
}

extension MainViewController {
    @objc private func addClientToStackView(_ notification: Notification) {
        guard let client: Client = notification.object as? Client else {
            return
        }
        
        DispatchQueue.main.async {
            let clientLabel = UILabel()
            clientLabel.text = "\(client.waitingNumber) - \(client.bankService)"
            clientLabel.textColor = client.bankService == .loan ? .systemPurple : .black
            self.mainView.waitingClientStackView.addArrangedSubview(clientLabel)
        }
    }
    
    @objc private func updateClientStackView(_ notification: Notification) {
        guard let client: Client = notification.object as? Client else {
            return
        }
        
        DispatchQueue.main.async {
            for label in self.mainView.waitingClientStackView.arrangedSubviews {
                guard let label = label as? UILabel else {
                    break
                }
                
                guard let waitingNumber = label.text?.waitingNumber else {
                    break
                }
                                
                if String(client.waitingNumber) == waitingNumber {
                    label.removeFromSuperview()
                    self.mainView.workingClientStackView.addArrangedSubview(label)
                }
            }
        }
    }
    
    @objc private func deleteClientStackView(_ notification: Notification) {
        guard let client: Client = notification.object as? Client else {
            return
        }
        
        DispatchQueue.main.async {
            for label in self.mainView.workingClientStackView.arrangedSubviews {
                guard let label = label as? UILabel else {
                    break
                }
                
                guard let waitingNumber = label.text?.waitingNumber else {
                    break
                }
                
                if String(client.waitingNumber) == waitingNumber {
                    label.removeFromSuperview()
                }
            }
        }
    }
}

extension MainViewController {
    private func setUpButtonAction() {
        mainView.addClientButton.addTarget(self, action: #selector(addClientToQueue), for: .touchUpInside)
        mainView.resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
    }
    
    @objc private func addClientToQueue() {
        bank?.receiveTenMoreClients()
    }
    
    @objc private func reset() {
        bank?.reset()
        mainView.workTimerLabel.text = Constants.workTimerLabelTitle
        mainView.waitingClientStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
}

extension MainViewController: TimerDelegate {
    func applyTimerToLabel(second: Int, milisecond: Int, nanosecond: Int) {
        mainView.workTimerLabel.text = "\(second):\(milisecond):\(nanosecond)"
    }
}
