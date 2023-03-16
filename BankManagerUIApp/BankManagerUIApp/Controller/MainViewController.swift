//
//  BankManagerUIApp - ViewController.swift
//  Created by 레옹아범, 혜모리. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    private var bank = Bank()
    private var timer: DispatchSourceTimer?
    private var isRunningTimer = false
    
    // MARK: UI 프로퍼티
    private let mainStackView = UIStackView()
    private let addCustomerButton = CustomButton(type: .system)
    private let resetButton = CustomButton(type: .system)
    private let billboardStackView = UIStackView()
    private let waitingStackView = QueueStackView()
    private let workingStackView = QueueStackView()
    
    private let workTimeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = false
        label.text = "업무시간 - \(BankOption.defalutWorkTime)"
        label.font = .preferredFont(forTextStyle: .title3)
        label.numberOfLines = 1
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureLayout()
        configureUI()
        configureObserver()
    }

    private func configureLayout() {
        configureMainStackView()
        createButtonStackView()
        createWorkTimeLabel()
        configureBillboardStackView()
        configureWaitingStackView()
        configureWorkingStackView()
    }
    
    private func configureUI() {
        addCustomerButton.setTitle("고객 10명 추가", for: .normal)
        addCustomerButton.addTarget(self, action: #selector(didTapAddCustomerButton), for: .touchUpInside)
        
        resetButton.setTitle("초기화", for: .normal)
        resetButton.setTitleColor(.red, for: .normal)
        resetButton.addTarget(self, action: #selector(didTapResetButton), for: .touchUpInside)
        
        waitingStackView.createTitleLabel("대기중", backgroundColor: .systemGreen)
        workingStackView.createTitleLabel("업무중", backgroundColor: .systemIndigo)
    }
    
    private func configureObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateCustomer),
                                               name: .workingNoti,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateCompletionOfCustomerWork),
                                               name: .completeNoti,
                                               object: nil)
    }
    
    private func configureTimer() {
        if timer != nil { return }
        
        var date = Date(timeIntervalSince1970: 0)
        
        timer = DispatchSource.makeTimerSource(queue: .main)
        timer?.schedule(deadline: .now(), repeating: .milliseconds(BankOption.timerMilliSecond))
        
        timer?.setEventHandler(handler: { [self] in
            date = date.addingTimeInterval(BankOption.timerSecond)
            
            DispatchQueue.main.async { [self] in
                workTimeLabel.text = "업무시간 - \(date.applyDateFormatter())"
            }
        })
        
        timer?.resume()
        isRunningTimer = true
    }
    
    @objc private func didTapAddCustomerButton() {
        configureTimer()
        
        if isRunningTimer == false {
            timer?.resume()
            isRunningTimer = true
        }
        
        for _ in 1...10 {
            guard let customer = bank.addCustomer() else { return }
            
            waitingStackView.addLabel(customer: customer)
        }
        
        bank.open()
        BankManager.isRunningWork = true
    }
    
    @objc func updateCustomer(_ noti: Notification) {
        guard let customer = noti.object as? Customer else { return }
        
        DispatchQueue.main.async { [self] in
            guard BankManager.isRunningWork else { return }
            
            waitingStackView.removeLabel(customer: customer)
            workingStackView.addLabel(customer: customer)
        }
    }

    @objc func updateCompletionOfCustomerWork(_ noti: Notification) {
        guard let customer = noti.object as? Customer else { return }
        
        DispatchQueue.main.async { [self] in
            workingStackView.removeLabel(customer: customer)
        }
        
        BankManager.workingGroup.notify(queue: .global()) { [self] in
            if isRunningTimer {
                timer?.suspend()
                isRunningTimer = false
            }
        }
    }
    
    @objc private func didTapResetButton() {
        bank = Bank()
        workTimeLabel.text = "업무시간 - \(BankOption.defalutWorkTime)"
        
        resetTimer()
        waitingStackView.resetLabel()
        workingStackView.resetLabel()
        BankManager.resetWork()
    }
    
    private func resetTimer() {
        if isRunningTimer == false {
            timer?.resume()
        }
        
        timer?.cancel()
        timer = nil
    }
}

// MARK: - UIStackView
extension MainViewController {
    private func configureMainStackView() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.alignment = .center
        mainStackView.spacing = 16
        
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func createButtonStackView() {
        let stackView = UIStackView(arrangedSubviews: [addCustomerButton, resetButton])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually

        mainStackView.addArrangedSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor)
        ])
    }
    
    private func configureBillboardStackView() {
        billboardStackView.translatesAutoresizingMaskIntoConstraints = false
        billboardStackView.axis = .horizontal
        billboardStackView.distribution = .fillEqually
        billboardStackView.alignment = .firstBaseline
        
        mainStackView.addArrangedSubview(billboardStackView)
        
        NSLayoutConstraint.activate([
            billboardStackView.leadingAnchor.constraint(equalTo: mainStackView.safeAreaLayoutGuide.leadingAnchor),
            billboardStackView.trailingAnchor.constraint(equalTo: mainStackView.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func configureWaitingStackView() {
        waitingStackView.translatesAutoresizingMaskIntoConstraints = false
        waitingStackView.axis = .vertical
        waitingStackView.distribution = .fill
        waitingStackView.alignment = .center
        waitingStackView.spacing = 16
        
        billboardStackView.addArrangedSubview(waitingStackView)
    }
    
    private func configureWorkingStackView() {
        workingStackView.translatesAutoresizingMaskIntoConstraints = false
        workingStackView.axis = .vertical
        workingStackView.distribution = .fill
        workingStackView.alignment = .center
        workingStackView.spacing = 16
        
        billboardStackView.addArrangedSubview(workingStackView)
    }
}

// MARK: - UILabel
extension MainViewController {
    private func createWorkTimeLabel() {
        mainStackView.addArrangedSubview(workTimeLabel)
    }
}
