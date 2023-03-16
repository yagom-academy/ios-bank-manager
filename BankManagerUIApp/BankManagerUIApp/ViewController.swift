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
    private let main = OperationQueue.main
    var timer: Timer?
    var taskTime: Double = 0.0
    var startTime = Date()
    var isOpened: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bank.delegate = self
        setUpScreenStackView()
        configureConstraint()
        setUpButton()
        setTimer()
        
    }
    
    private func setUpScreenStackView() {
        view.backgroundColor = .white
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

    private func setUpButton() {
        addClientButtonTapped()
        resetButtonTapped()
    }
    
    private func addClientButtonTapped() {
        buttonStackView.addClientButton.addTarget(self, action: #selector(addTenClients), for: .touchUpInside)
    }
    
    private func setTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timeUp), userInfo: nil, repeats: true)
    }
    
    @objc private func timeUp() {
        
        let timeInterval = Date().timeIntervalSince(self.startTime)
        
        let minute = (Int)(fmod((timeInterval/60), 60))
        let second = (Int)(fmod(timeInterval, 60))
        let milliSecond = (Int)((timeInterval - floor(timeInterval))*1000)
        
        let minuteLabel = String(format: "%02d", minute)
        let secondLabel = String(format: "%02d", second)
        let milliSecondLabel = String(format: "%02d", milliSecond)
        taskTimerLabel.text = " 업무시간 - \(minuteLabel) : \(secondLabel) : \(milliSecondLabel)"
        
    }
    
    @objc private func addTenClients() {
        bank.lineUpClient()
        bank.doTask()
        isOpened = true
        self.startTime = Date()
    }
    
    private func resetButtonTapped() {
        buttonStackView.resetButton.addTarget(self, action: #selector(resetAll), for: .touchUpInside)
    }
    
    @objc func resetAll() {
        queueStackView.waitingQueueStackView.waitingScrollView.waitingClientStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        queueStackView.doingTaskStackView.doingTaskScrollView.taskClientStackView.arrangedSubviews.forEach { $0.removeFromSuperview()}
        bank.reset()
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
    
    func startTask(of client: Client) {
        main.addOperation { [self] in
            queueStackView.waitingQueueStackView.waitingScrollView.waitingClientStackView.arrangedSubviews.forEach {
                let label = $0 as? UILabel
                if label?.text == "\(client.waitingNumber) - \(client.purposeOfVisit.rawValue)" {
                    $0.removeFromSuperview()
                    queueStackView.doingTaskStackView.doingTaskScrollView.taskClientStackView.addArrangedSubview($0)
                }
            }
        }
    }
    
    func completeTask(of client: Client) {
        main.addOperation { [self] in
            queueStackView.doingTaskStackView.doingTaskScrollView.taskClientStackView.arrangedSubviews.forEach {
                let label = $0 as? UILabel
                if label?.text == "\(client.waitingNumber) - \(client.purposeOfVisit.rawValue)" {
                    $0.removeFromSuperview()
                }
            }
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

