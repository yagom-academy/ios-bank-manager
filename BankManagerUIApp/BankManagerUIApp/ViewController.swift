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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreenStackView()
        configureConstraint()
        view.backgroundColor = .white
        
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

/*
 과일재고 -> label    과일재고 notification, delegate
 주문화면 - 재고수정화면 (화면간 화면)
 
 
 대기중인 고객 -> label  고객 10명추가 대기중인고객 delegate
 model (clientCount/client) - viewController
 */
