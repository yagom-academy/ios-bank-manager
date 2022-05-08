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
        setUpDelegate()
        setUpButtonAction()
        bank?.open()
    }
    
    private func setUpDelegate() {
        bank?.bankTimer.delegate = self
        bank?.delegate = self
        bank?.bankClerks.forEach {
            $0.delegate = self
        }
    }
}

extension MainViewController: BankClerkDelegate {
    func updateClientStackView(client: Client) {
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
    
    func deleteClientStackView(client: Client) {
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

extension MainViewController: BankDelegate {
     func addClientToStackView(client: Client) {
        DispatchQueue.main.async {
            let clientLabel = UILabel()
            clientLabel.text = "\(client.waitingNumber) - \(client.bankService)"
            clientLabel.textColor = client.bankService == .loan ? .systemPurple : .black
            self.mainView.waitingClientStackView.addArrangedSubview(clientLabel)
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
