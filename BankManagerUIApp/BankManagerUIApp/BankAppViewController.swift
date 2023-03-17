//
//  BankManagerUIApp - BankAppViewController.swift
//  Created by 리지, 무리.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class BankAppViewController: UIViewController {
    //MARK: View Objects
    private let screenStackView = ScreenStackView()
    private let buttonStackView = ButtonStackView()
    private let taskTimerLabel = TaskTimerLabel()
    private let queueStackView = QueueStackView()
    
    //MARK: Bank Object
    private var bank = Bank()
    private let main = OperationQueue.main
    
    //MARK: Timer Properties
    private var timer: Timer?
    private var taskTime: Double = 0
    private var isOpen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bank.delegate = self
        setUpScreenStackView()
        configureConstraintScreenStackView()
        setUpButton()
        setUpTimer()
    }
    
    //MARK: stackView Method
    private func setUpScreenStackView() {
        view.backgroundColor = .white
        view.addSubview(screenStackView)
        screenStackView.addArrangedSubview(buttonStackView)
        screenStackView.addArrangedSubview(taskTimerLabel)
        screenStackView.addArrangedSubview(queueStackView)
    }
    
    private func configureConstraintScreenStackView() {
        NSLayoutConstraint.activate([
            screenStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            screenStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            screenStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            screenStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            taskTimerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
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
    
    //MARK: Button Method
    private func setUpButton() {
        addClientButtonTapped()
        resetButtonTapped()
    }
    
    private func addClientButtonTapped() {
        buttonStackView.addClientButton.addTarget(self, action: #selector(addTenClients), for: .touchUpInside)
    }
    
    @objc private func addTenClients() {
        bank.lineUpClient()
        bank.doTask()
        isOpen = true
    }
    
    private func resetButtonTapped() {
        buttonStackView.resetButton.addTarget(self, action: #selector(resetAll), for: .touchUpInside)
    }
    
    @objc func resetAll() {
        isOpen = false
        taskTime = 0
        queueStackView.waitingQueueStackView.waitingScrollView.waitingClientStackView
            .arrangedSubviews.forEach { $0.removeFromSuperview() }
        queueStackView.doingTaskStackView.doingTaskScrollView.taskClientStackView
            .arrangedSubviews.forEach { $0.removeFromSuperview()}
        bank.reset()
    }
    
    //MARK: Timer Method
    private func setUpTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timeUp), userInfo: nil, repeats: true)
    }
    
    @objc private func timeUp() {
        if isOpen == true {
            taskTime += 0.001
        }
        let timeInterval = taskTime
        let minute = (Int)(fmod((timeInterval/60), 60))
        let second = (Int)(fmod(timeInterval, 60))
        let milliSecond = (Int)((timeInterval - floor(timeInterval))*1000)
        
        let minuteLabel = String(format: "%02d", minute)
        let secondLabel = String(format: "%02d", second)
        let milliSecondLabel = String(format: "%03d", milliSecond)
        taskTimerLabel.text = " 업무시간 - \(minuteLabel) : \(secondLabel) : \(milliSecondLabel)"
    }
}

//MARK: - BankAppDelegate

extension BankAppViewController: BankDelegate {
    func sendData(of client: Client) {
        let waitingClientLabel = makeLabel(of: client)
        
        queueStackView.waitingQueueStackView.waitingScrollView.waitingClientStackView.addArrangedSubview(waitingClientLabel)
    }
    
    func startTask(of client: Client) {
        main.addOperation { [unowned self] in
            queueStackView.waitingQueueStackView.waitingScrollView.waitingClientStackView
                .arrangedSubviews.forEach {
                let label = $0 as? UILabel
                    
                if label?.text == "\(client.waitingNumber) - \(client.purposeOfVisit.rawValue)" {
                    $0.removeFromSuperview()
                    queueStackView.doingTaskStackView.doingTaskScrollView.taskClientStackView.addArrangedSubview($0)
                }
            }
        }
    }
    
    func completeTask(of client: Client) {
        main.addOperation { [unowned self] in
            queueStackView.doingTaskStackView.doingTaskScrollView.taskClientStackView
                .arrangedSubviews.forEach {
                let label = $0 as? UILabel
                    
                if label?.text == "\(client.waitingNumber) - \(client.purposeOfVisit.rawValue)" {
                    $0.removeFromSuperview()
                }
            }
            if queueStackView.waitingQueueStackView.waitingScrollView.waitingClientStackView
                .subviews.isEmpty && queueStackView.doingTaskStackView.doingTaskScrollView.taskClientStackView
                .subviews.isEmpty {
                isOpen = false
            }
        }
    }
}


//MARK: - Canvas

import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = BankAppViewController
    
    func makeUIViewController(context: Context) -> BankAppViewController {
        return BankAppViewController()
    }
    
    func updateUIViewController(_ uiViewController: BankAppViewController, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}

