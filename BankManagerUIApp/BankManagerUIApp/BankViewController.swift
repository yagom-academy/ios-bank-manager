//
//  BankManagerUIApp - BankViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class BankViewController: UIViewController {
    var bank: Bank?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bank = Bank()
        bank?.delegate = self
        
        view = BankManagerView()
        let bankView = view as? BankManagerView
        bankView?.addClientsButton.addTarget(
            self,
            action: #selector(addClients),
            for: .touchUpInside
        )
    }
    
    @objc func addClients() {
        bank?.addClientsToQueue(by: 10)
        bank?.startBankingService()
    }
}

extension BankViewController: BankDelegate {
    func updateServiceTimeLabel(serviceTime: Double) {
        let view = view as? BankManagerView
        let timeString = secondsToTimeString(serviceTime: serviceTime)
        view?.serviceTimeLabel.text = "업무시간 - \(timeString)"
    }
    
    func secondsToTimeString (serviceTime: Double) -> String {
        let minute = Int(serviceTime / 60)
        let second = Int(serviceTime) % 60
        let milisecond = Int((serviceTime - Double(Int(serviceTime))) * 1000)
        return String(format: "%.2d:%.2d:%.3d", minute, second, milisecond)
    }
    
    func addWaitingClient(client: Client) {
        let view = view as? BankManagerView
        let label = ClientLabel(client: client)
        view?.waitingQueueStackView.addArrangedSubview(label)
    }
    
    func addProcessingClient(client: Client) {
        let view = view as? BankManagerView
        let label = ClientLabel(client: client)
        view?.processingQueueStackView.addArrangedSubview(label)
    }
    
    func removeWaitingClient(client: Client) {
        guard let view = view as? BankManagerView else {
            return
        }
        
        for label in view.waitingQueueStackView.arrangedSubviews {
            let label = label as? ClientLabel
            let clientText = "\(client.waitingNumber) - \(client.business)"
            if label?.text == clientText {
                label?.removeFromSuperview()
                return
            }
        }
    }
    
    func removeProcessingClient(client: Client) {
        guard let view = view as? BankManagerView else {
            return
        }
        
        for label in view.processingQueueStackView.arrangedSubviews {
            let label = label as? ClientLabel
            let clientText = "\(client.waitingNumber) - \(client.business)"
            if label?.text == clientText {
                label?.removeFromSuperview()
                return
            }
        }
    }
}
