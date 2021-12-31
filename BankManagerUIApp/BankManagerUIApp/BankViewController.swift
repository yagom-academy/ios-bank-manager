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
        initializeView()
    }
    
    @objc private func addClients() {
        bank?.addClientsToQueue(by: 10)
        bank?.startBankingService()
    }
    
    @objc private func resetAll() {
        bank?.invalidateTimer()
        bank?.delegate = nil
        bank = Bank()
        bank?.delegate = self
        initializeView()
    }
    
    private func initializeView() {
        view = BankManagerView()
        let bankView = view as? BankManagerView
        bankView?.addClientsButton.addTarget(
            self,
            action: #selector(addClients),
            for: .touchUpInside
        )
        bankView?.resetButton.addTarget(
            self,
            action: #selector(resetAll),
            for: .touchUpInside
        )
    }
    
    private func secondsToTimeString (serviceTime: Double) -> String {
        let minute = Int(serviceTime / 60)
        let second = Int(serviceTime) % 60
        let milisecond = Int((serviceTime - Double(Int(serviceTime))) * 1000)
        return String(format: "%.2d:%.2d:%.3d", minute, second, milisecond)
    }
    
    private func removeLabel(client: Client, from stackSubviews: [UIView]) {
        for label in stackSubviews {
            let label = label as? ClientLabel
            let clientText = "\(client.waitingNumber) - \(client.business)"
            if label?.text == clientText {
                label?.removeFromSuperview()
                return
            }
        }
    }
}

extension BankViewController: BankDelegate {
    func updateServiceTimeLabel(serviceTime: Double) {
        let view = view as? BankManagerView
        let timeString = secondsToTimeString(serviceTime: serviceTime)
        view?.serviceTimeLabel.text = "업무시간 - \(timeString)"
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
        let stackSubviews =  view.waitingQueueStackView.arrangedSubviews
        removeLabel(client: client, from: stackSubviews)
    }
    
    func removeProcessingClient(client: Client) {
        guard let view = view as? BankManagerView else {
            return
        }
        let stackSubviews =  view.processingQueueStackView.arrangedSubviews
        removeLabel(client: client, from: stackSubviews)
    }
}
