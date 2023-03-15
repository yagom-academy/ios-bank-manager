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
    let bank = Bank(loanBankerCount: 1, depositBankerCount: 2)
    let notification = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        registerObserver()
        setMainStackView()
    }
    
    private func registerObserver() {
        notification.addObserver(self,
                                 selector: #selector(registerCustomerView),
                                 name: .waiting,
                                 object: nil)
        
        notification.addObserver(self,
                                 selector: #selector(moveToWorkingView),
                                 name: .working,
                                 object: nil)
        
        notification.addObserver(self,
                                 selector: #selector(deleteCustomerLabelFromView),
                                 name: .finished,
                                 object: nil)
        

    }
    
    @objc func registerCustomerView(_ notification:NSNotification) {
        guard let customer = notification.userInfo?[NotificationKey.waiting] as? Customer else {
            return
        }
        
        let customerLabel = CustomerLabel(customer: customer)
        waitingStackView.addArrangedSubview(customerLabel)
        waitingStackView.layoutIfNeeded()
    }
    
    @objc func moveToWorkingView(_ notification:NSNotification) {
        
    }
    
    @objc func deleteCustomerLabelFromView(_ notification:NSNotification) {
        
    }
    
    private func setMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.distribution = .fill
        mainStackView.spacing = 10
        mainStackView.setAutoLayoutConstraint(equalTo: view.safeAreaLayoutGuide)
        
        let buttonStackView = makeButtonStackView()
        let timerLabel = makeTimerLabel()
        let queueLabelStackView = makeQueueLabelStackView()
        let customerStackView = makeCustomerStackView()
        
        mainStackView.addArrangedSubview(buttonStackView)
        mainStackView.addArrangedSubview(timerLabel)
        mainStackView.addArrangedSubview(queueLabelStackView)
        mainStackView.addArrangedSubview(customerStackView)
    }
    
    private func makeButtonStackView() -> UIStackView {
        let addCustomerButton = {
            let button = UIButton()
            button.setTitle("고객 10명 추가", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.addTarget(self, action: #selector(addTenCustomer), for: .touchUpInside)
            
            return button
        }()
        
        let resetButton = {
            let button = UIButton()
            button.setTitle("초기화", for: .normal)
            button.setTitleColor(.systemRed, for: .normal)
            
            return button
        }()
        
        let buttonStackView = HorizontalStackView(arrangedSubviews: [addCustomerButton, resetButton])
        
        return buttonStackView
    }
    
    private func makeTimerLabel() -> UILabel {
        let timerLabel = {
            let label = UILabel()
            label.text = "타이머 넣기"
            label.font = .preferredFont(forTextStyle: .title2)
            label.textColor = .black
            label.textAlignment = .center
            
            return label
        }()
        
        return timerLabel
    }
    
    private func makeQueueLabelStackView() -> UIStackView {
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
        
        let queueLabelStackView = HorizontalStackView(arrangedSubviews: [waitingLabel, workingLabel])
        
        return queueLabelStackView
    }
    
    private func makeCustomerStackView() -> UIStackView {
        let customerStackView = {
            let stackView = HorizontalStackView()
            stackView.alignment = .top
            
            return stackView
        }()
        
        let waitingScrollView = {
            let scrollView = UIScrollView()
            scrollView.addSubview(waitingStackView)
      
            return scrollView
        }()
        

        waitingScrollView.addSubview(waitingStackView)
        waitingStackView.distribution = .equalSpacing
        
        
        waitingStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            waitingStackView.leadingAnchor.constraint(equalTo: waitingScrollView.leadingAnchor),
            waitingStackView.trailingAnchor.constraint(equalTo: waitingScrollView.trailingAnchor),
            waitingStackView.topAnchor.constraint(equalTo: waitingScrollView.topAnchor),
            waitingStackView.bottomAnchor.constraint(equalTo: waitingScrollView.bottomAnchor),
            waitingStackView.heightAnchor.constraint(equalTo: waitingScrollView.heightAnchor)
        ])
        
        customerStackView.addArrangedSubview(waitingScrollView)
        customerStackView.addArrangedSubview(workingStackView)
        
        return customerStackView
    }
    
    @objc private func addTenCustomer() {
        bank.open(totalCustomer: 10)
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
