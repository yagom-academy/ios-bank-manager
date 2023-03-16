//
//  BankManagerUIApp - BankManagerViewController.swift
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
    }
    
    @objc func moveToWorkingView(_ notification:NSNotification) {
        guard let customer = notification.userInfo?[NotificationKey.working] as? Customer else {
            return
        }
        
        let index = waitingStackView.arrangedSubviews.firstIndex { label  in
            if let customerLabel = label as? CustomerLabel,
               customerLabel.identifierNumber == customer.numberTicket {
                return true
            }
            return false
        }
        
        let view = waitingStackView.arrangedSubviews[index!]
        waitingStackView.removeArrangedSubview(view)
        workingStackView.addArrangedSubview(view)
    }
    
    @objc func deleteCustomerLabelFromView(_ notification:NSNotification) {
        guard let customer = notification.userInfo?[NotificationKey.finished] as? Customer else {
            return
        }
        
        let index = workingStackView.arrangedSubviews.firstIndex { label  in
            if let customerLabel = label as? CustomerLabel,
               customerLabel.identifierNumber == customer.numberTicket {
                return true
            }
            return false
        }
        
        guard let bindedIndex = index else { return }
        
        let view = workingStackView.arrangedSubviews[bindedIndex]
        view.removeFromSuperview()
    }
    
    private func setMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.distribution = .fill
        mainStackView.spacing = 10
        mainStackView.setLayoutConstraint(toLayoutGuide: view.safeAreaLayoutGuide)
        
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
            button.addTarget(self,
                             action: #selector(addTenCustomer),
                             for: .touchUpInside)
            
            return button
        }()
        
        let resetButton = {
            let button = UIButton()
            button.setTitle("초기화", for: .normal)
            button.setTitleColor(.systemRed, for: .normal)
            button.addTarget(self,
                             action: #selector(reset),
                             for: .touchUpInside)
            
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
        
        waitingStackView.setLayoutConstraint(toView: waitingScrollView, needWidthAnchor: true)
        let heightConstraint = waitingStackView.heightAnchor.constraint(equalTo: waitingScrollView.frameLayoutGuide.heightAnchor)
        heightConstraint.priority = UILayoutPriority(250)
        heightConstraint.isActive = true
        
        customerStackView.addArrangedSubview(waitingScrollView)
        customerStackView.addArrangedSubview(workingStackView)
        
        return customerStackView
    }
    
    @objc private func addTenCustomer() {
        let totalCustomer = 10
        bank.open(totalCustomer: totalCustomer)
    }
    
    @objc private func reset() {
        bank.close()
        resetCustomerStackView()
    }
    
    private func resetCustomerStackView() {
        waitingStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        workingStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
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
