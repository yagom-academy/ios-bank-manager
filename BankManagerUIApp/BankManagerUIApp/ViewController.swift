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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreenStackView()
        configureConstraint()
        
    }
    
    private func setUpScreenStackView() {
        view.addSubview(screenView)
        screenView.addArrangedSubview(buttonStackView)
        screenView.addArrangedSubview(screenView.taskTimerLabel)
        screenView.addArrangedSubview(queueStackView)
        
    }
    
    private func configureConstraint() {
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: screenView.topAnchor, constant: 50),
            buttonStackView.leadingAnchor.constraint(equalTo: screenView.leadingAnchor),
            screenView.taskTimerLabel.leadingAnchor.constraint(equalTo: screenView.leadingAnchor),
            queueStackView.leadingAnchor.constraint(equalTo: screenView.leadingAnchor),
            queueStackView.bottomAnchor.constraint(equalTo: screenView.bottomAnchor),
            buttonStackView.centerXAnchor.constraint(equalTo: screenView.centerXAnchor),
            screenView.taskTimerLabel.centerXAnchor.constraint(equalTo: screenView.centerXAnchor),
            queueStackView.centerXAnchor.constraint(equalTo: screenView.centerXAnchor),
            screenView.topAnchor.constraint(equalTo: view.topAnchor),
            screenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            screenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            screenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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

