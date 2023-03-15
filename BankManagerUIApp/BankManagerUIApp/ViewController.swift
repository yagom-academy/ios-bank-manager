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
        bank.delegate = self
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
            screenStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            screenStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            screenStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            taskTimerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }
    
    private func addClientButtonTapped() {
        buttonStackView.addClientButton.addTarget(self, action: #selector(addTenClients), for: .touchUpInside)
    }
    
    @objc func addTenClients() {
        bank.lineUpClient()
        bank.doTask()
    }
    
    private func makeLabel(of client: Client) -> UILabel {
        let clientLabel = UILabel()
        let message = "\(client.waitingNumber) - \(client.purposeOfVisit.rawValue)"
        clientLabel.text = message
        clientLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        clientLabel.textAlignment = .center
        
        switch client.purposeOfVisit {
        case .loan:
            clientLabel.textColor = .systemPurple
        case .deposit:
            clientLabel.textColor = .black
        }
        
        return clientLabel
    }
}

extension ViewController: BankDelegate {
    func sendData(of client: Client) {
       let waitingClientLabel = makeLabel(of: client)
        
        queueStackView.waitingQueueStackView.waitingScrollView.waitingClientStackView.addArrangedSubview(waitingClientLabel)
    }

    func processData(of client: Client) {
        let doingTaskClientLabel = makeLabel(of: client)
        queueStackView.waitingQueueStackView.waitingScrollView.waitingClientStackView.arrangedSubviews[0].removeFromSuperview()
        queueStackView.doingTaskStackView.doingTaskScrollView.taskClientStackView.addArrangedSubview(doingTaskClientLabel)
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

