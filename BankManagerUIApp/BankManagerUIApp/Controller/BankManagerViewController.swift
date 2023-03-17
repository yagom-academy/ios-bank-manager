//
//  BankManagerUIApp - BankManagerViewController.swift
//  Created by Rowan, 릴라. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class BankManagerViewController: UIViewController {
    private let workingStackView = VerticalStackView()
    private let waitingStackView = VerticalStackView()
    private let mainStackView = VerticalStackView()
    private let timerLabel = UILabel()
    
    private let bank = Bank(depositBankerCount: 2, loanBankerCount: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setMainStackView()
        registerObserver()
    }
    
    // MARK: - UI Setting
    private func setMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.setLayoutConstraint(toLayoutGuide: view.safeAreaLayoutGuide)
        mainStackView.distribution = .fill
        mainStackView.spacing = 10
        
        setTimerLabel()
        let buttonStackView = makeButtonStackView()
        let customerStackView = makeCustomerStackView()
        let queueLabelStackView = makeQueueLabelStackView()
        
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
            button.addTarget(self, action: #selector(reset), for: .touchUpInside)
            
            return button
        }()
        
        let buttonStackView = HorizontalStackView(arrangedSubviews: [addCustomerButton, resetButton])
        
        return buttonStackView
    }
    
    private func setTimerLabel()  {
        timerLabel.text = "업무시간 - 00:00:000"
        timerLabel.font = .preferredFont(forTextStyle: .title2)
        timerLabel.textColor = .black
        timerLabel.textAlignment = .center
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
            scrollView.showsVerticalScrollIndicator = false
            
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
        startTimer()
    }
    
    @objc private func reset() {
        pauseTimer()
        bank.close()
        resetTimerLabel()
        resetCustomerStackView()
    }
    
    private func resetTimerLabel() {
        timerLabel.text = "업무시간 - 00:00:000"
        timerNum = 0
    }
    
    private func resetCustomerStackView() {
        waitingStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        workingStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }
    
    // MARK: - Notification
    private func registerObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(registerCustomerView),
                                               name: .waiting,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(moveToWorkingView),
                                               name: .working,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(deleteCustomerLabelFromView),
                                               name: .finished,
                                               object: nil)
    }
    
    @objc private func registerCustomerView(_ notification:NSNotification) {
        guard let customer = notification.userInfo?[NotificationKey.waiting] as? Customer else {
            return
        }
        
        let customerLabel = CustomerLabel(customer: customer)
        waitingStackView.addArrangedSubview(customerLabel)
    }
    
    @objc private func moveToWorkingView(_ notification:NSNotification) {
        guard let customer = notification.userInfo?[NotificationKey.working] as? Customer,
              let index = findIndex(in: waitingStackView, customer: customer) else {
            return
        }
        
        let view = waitingStackView.arrangedSubviews[index]
        waitingStackView.removeArrangedSubview(view)
        workingStackView.addArrangedSubview(view)
    }
    
    @objc private func deleteCustomerLabelFromView(_ notification:NSNotification) {
        guard let customer = notification.userInfo?[NotificationKey.finished] as? Customer,
              let index = findIndex(in: workingStackView, customer: customer) else {
            return
        }
        
        let view = workingStackView.arrangedSubviews[index]
        view.removeFromSuperview()
        
        if waitingStackView.arrangedSubviews.isEmpty && workingStackView.arrangedSubviews.isEmpty {
            timer.invalidate()
        }
    }
    
    private func findIndex(in stackView: UIStackView, customer: Customer) -> Int? {
        let index = stackView.arrangedSubviews.firstIndex { label  in
            guard let customerLabel = label as? CustomerLabel else { return false }
            
            return customerLabel.identifierNumber == customer.numberTicket
        }
        
        return index
    }
    
    // MARK: - Timer
    private var timer: Timer = Timer()
    private var timerNum: Double = 0
    
    private func startTimer() {
        guard timer.isValid == false else { return }
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.001,
                                          target: self,
                                          selector: #selector(self.updateTimer),
                                          userInfo: nil,
                                          repeats: true)
        RunLoop.current.add(self.timer, forMode: .common)
    }
    
    private func pauseTimer() {
        timer.invalidate()
    }
    
    @objc private func updateTimer() {
        timerNum += 0.001
        
        let totalSecond = Int(timerNum)
        let minute = totalSecond / 60
        let second = totalSecond % 60
        let miliSecond = Int((timerNum - Double(totalSecond)) * 1000)
        let textFormat = "업무시간 - %02d:%02d:%003d"
        
        self.timerLabel.text = String(format: textFormat, minute, second, miliSecond)
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
