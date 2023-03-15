//
//  BankManagerUIApp - ViewController.swift
//  Created by Rowan, 릴라. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


final class BankManagerViewController: UIViewController {
    let mainStackView = VerticalStackView()
    let workingStackView = VerticalStackView()
    let waitingStackView = VerticalStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setMainStackView()
        setButtons()
        setTimerLabel()
        setQueueLabel()
        setCustomerScrollView()
    }
    
    private func setMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.spacing = 10
        mainStackView.setAutoLayoutConstraint(equalTo: view.safeAreaLayoutGuide)
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
        
        let stackView = HorizontalStackView(arrangedSubviews: [addCustomerButton, resetButton])
        
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
    
    private func setCustomerScrollView() {
        let anotherStackView = {
            let stackView = HorizontalStackView()
            stackView.alignment = .top
            
            return stackView
        }()
        
        let waitingScrollView = {
            let scrollView = UIScrollView()
            scrollView.addSubview(waitingStackView)
            
            return scrollView
        }()
        
        waitingStackView.setAutoLayoutConstraint(equalTo: waitingScrollView.safeAreaLayoutGuide)
        
        anotherStackView.addArrangedSubview(waitingScrollView)
        anotherStackView.addArrangedSubview(workingStackView)
        
        mainStackView.addArrangedSubview(anotherStackView)
        
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
