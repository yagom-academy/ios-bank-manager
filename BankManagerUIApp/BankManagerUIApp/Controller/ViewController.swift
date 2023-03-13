//
//  BankManagerUIApp - ViewController.swift
//  Created by Rowan, 릴라. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


final class BankManagerViewController: UIViewController {
    let mainStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setMainStackView()
        setButtons()
        setTimerLabel()
        setQueueLabel()
    }
    
    private func setMainStackView() {
        view.addSubview(mainStackView)
        
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.spacing = 10
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    private func setButtons() {
        let addCustomerButton = {
            let button = UIButton()
            button.setTitle("고객 10명 추가", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            
            return button
        }()
        
        
        let resetButton = {
            let button = UIButton()
            button.setTitle("초기화", for: .normal)
            button.setTitleColor(.systemRed, for: .normal)
            
            return button
        }()
        
        let stackView = {
            let stackView = UIStackView(arrangedSubviews: [addCustomerButton, resetButton])
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            
            return stackView
        }()
        
        mainStackView.addArrangedSubview(stackView)
    }
    
    private func setTimerLabel() {
        let timerLabel = {
            let label = UILabel()
            label.text = "타이머 넣기"
            label.font = .preferredFont(forTextStyle: .title2)
            label.textColor = .black
            label.textAlignment = .center
            
            return label
        }()
        
        mainStackView.addArrangedSubview(timerLabel)
    }
    
    private func setQueueLabel() {
        let waitingLabel = {
            let label = UILabel()
            label.textColor = .white
            label.backgroundColor = .systemGreen
            label.text = "대기중"
            label.textAlignment = .center
            label.font = .preferredFont(forTextStyle: .title1)
            
            return label
        }()
        
        let workingLabel = {
            let label = UILabel()
            label.textColor = .white
            label.backgroundColor = .systemIndigo
            label.text = "업무중"
            label.textAlignment = .center
            label.font = .preferredFont(forTextStyle: .title1)
            
            return label
        }()
        
        let stackView = {
            let stackView = UIStackView(arrangedSubviews: [waitingLabel, workingLabel])
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            
            return stackView
        }()
        
        mainStackView.addArrangedSubview(stackView)
    }
    
    
}

import SwiftUI

struct SwiftUIViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = BankManagerViewController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        return BankManagerViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        SwiftUIViewController()
    }
}
