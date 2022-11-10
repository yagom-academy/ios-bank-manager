//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class BankViewController: UIViewController {
    lazy var mainView = MainView()

    private let banker: Banker = Banker()
    private var clientQueue: ClientQueue = ClientQueue()
    private var bankManager: BankManager = BankManager()
    
    private lazy var bank: Bank = Bank(banker: banker, queue: clientQueue, bankManager: bankManager)
    
    private func addButtonTarget() {
        mainView.clientAddButton.addTarget(self, action: #selector(addClient), for: .touchUpInside)
        mainView.clearButton.addTarget(self, action: #selector(resetData), for: .touchUpInside)
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNotification()
        addButtonTarget()
    }
    
    @objc func addClient() {
        for _ in 1...10 {
            if let client = bank.updateClientQueue() {
                mainView.waitingStackView.addArrangedSubview(makeClientLabel(client))
            }
        }
        bank.startBankWork()
    }
    
    @objc func resetData() {
        bank.resetAll()
        mainView.workingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        mainView.waitingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        
    }
    
    private func makeClientLabel(_ client: Client) -> UILabel {
        let label = UILabel()
        label.text = "\(client.waitingTicket) - \(client.purpose.name)"
        label.textColor = client.purpose == .deposit ? .black : .systemPurple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func addNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handlingStackView),
                                               name: .client,
                                               object: nil)
    }
    
    @objc func handlingStackView(noti: Notification) {
        guard let workState = noti.userInfo?["WorkState"] as? WorkState else { return }
        
        switch workState {
        case .start:
            handleLabel(by: mainView.waitingStackView, noti: noti)
        case .done:
            handleLabel(by: mainView.workingStackView, noti: noti)
        }
    }

    private func addToWorkingStackView(_ label: UILabel) {
        mainView.workingStackView.addArrangedSubview(label)
    }
    
    private func handleLabel(by stackView: UIStackView, noti: Notification) {
        DispatchQueue.main.async { [weak self] in
            guard let client = noti.object as? Client else { return }
            let ticketNumber = client.waitingTicket
            
            guard let labels = stackView.arrangedSubviews as? [UILabel],
                  let targetLabel = labels.filter({ label in
                      if let text = label.text?.split(separator: " ").first,
                         Int(text) == ticketNumber {
                          return true
                      }
                      return false
                  }).first else { return }
            
            targetLabel.removeFromSuperview()
            
            if stackView == self?.mainView.waitingStackView {
                self?.addToWorkingStackView(targetLabel)
            }
        }
    }
}
