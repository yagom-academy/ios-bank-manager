//
//  BankManagerUIApp - ViewController.swift
//  Created by 리지, 무리.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private let screenStackView = ScreenStackView()
    private let buttonStackView = ButtonStackView()
    private let taskTimerLabel = TaskTimerLabel()
    private let queueStackView = QueueStackView()
    
    private var bank = Bank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreenStackView()
        configureConstraint()
        view.backgroundColor = .white
        addClientButtonTapped()
    }
    
    private func setUpScreenStackView() {
        view.addSubview(screenStackView)
        screenStackView.addArrangedSubview(buttonStackView)
        screenStackView.addArrangedSubview(taskTimerLabel)
        screenStackView.addArrangedSubview(queueStackView)
    }
    
    private func configureConstraint() {
        //screenView
        NSLayoutConstraint.activate([
            screenStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            screenStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            screenStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            screenStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            taskTimerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
        ])
    }
    
    private func addClientButtonTapped() {
        buttonStackView.addClientButton.addTarget(self, action: #selector(addTenClients), for: .touchUpInside)
    }
    
    @objc func addTenClients() {
        bank.lineUpClient()
        
        for _ in 1...bank.clientCount {
            let clientLabel = ClientLabel()
            guard let client = bank.waitingLine.dequeue() else { return }
            let message = "\(client.waitingNumber) - \(client.purposeOfVisit.rawValue)"
            
            clientLabel.text = message
            
            queueStackView.waitingQueueStackView.waitingScrollView.waitingClientStackView.addArrangedSubview(clientLabel)
        }
        
    }
    
}


//MARK: - Canvas

import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
