//
//  BankManagerUIApp - ViewController.swift
//  Created by 리지, 무리.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private let screenView = ScreenStackView()
    private let buttonStackView = ButtonStackView()
    private let taskTimerLabel = TaskTimerLabel()
    private let queueStackView = QueueStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreenStackView()
        configureConstraint()
        view.backgroundColor = .white
    }
    
    private func setUpScreenStackView() {
        view.addSubview(screenView)
        screenView.addArrangedSubview(buttonStackView)
        screenView.addArrangedSubview(taskTimerLabel)
        screenView.addArrangedSubview(queueStackView)
        
    }

    private func configureConstraint() {
        //screenView
        NSLayoutConstraint.activate([
            screenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            screenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            screenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            screenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            taskTimerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
        ])
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

