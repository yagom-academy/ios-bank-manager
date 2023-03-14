//
//  BankManagerUIApp - ViewController.swift
//  Created by 리지, 무리.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private let screenView = ScreenStackView()
    private let buttonStackView = ButtonStackView()
    private let queueStackView = QueueStackView()
    
    private let waitingQueueStackView = WaitingQueueStackView()
    private let waitingQueueLabel = WaitingQueueLabel()
    private let waitingScrollView = WaitingScrollView()
    
    private let doingTaskStackView = DoingTaskStackView()
    private let doingTaskLabel = DoingTaskLabel()
    private let doingTaskScrollView = DoingTaskScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configureConstraint()
      
    }
    
    private func setUpView() {
        setUpScreenStackView()
        setUpWaitingQueueStackView()
        setUpDoingTaskStackView()
    }
    
    private func setUpScreenStackView() {
        view.addSubview(screenView)
        screenView.addArrangedSubview(buttonStackView)
        screenView.addArrangedSubview(screenView.taskTimerLabel)
        screenView.addArrangedSubview(queueStackView)
        
        queueStackView.addArrangedSubview(waitingQueueStackView)
        queueStackView.addArrangedSubview(doingTaskStackView)
        
    }
    
    private func setUpWaitingQueueStackView() {
        waitingQueueStackView.addArrangedSubview(waitingQueueLabel)
        waitingQueueStackView.addArrangedSubview(waitingScrollView)
    }
    
    private func setUpDoingTaskStackView() {
        doingTaskStackView.addArrangedSubview(doingTaskLabel)
        doingTaskStackView.addArrangedSubview(doingTaskScrollView)
    }
    
    private func configureConstraint() {
        //screenView
        NSLayoutConstraint.activate([
            screenView.topAnchor.constraint(equalTo: view.topAnchor),
            screenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            screenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            screenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            screenView.taskTimerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70)
        ])
    }
}




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

