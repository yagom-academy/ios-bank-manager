//
//  BankManagerUIApp - ViewController.swift
//  Created by 레옹아범, 혜모리. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    private var bank = Bank()
    private var timer: DispatchSourceTimer?
    private var date = Date(timeIntervalSince1970: 0)
    private var isRunningTimer = false
    private let addCustomerButton = CustomButton(type: .system)
    private let resetButton = CustomButton(type: .system)
    private let mainStackView = UIStackView()
    private let billboardStackView = UIStackView()
    private let waitingStackView = QueueStackView()
    private let workingStackView = QueueStackView()
    
    private let workTimeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = false
        label.text = "업무시간 - 00:00:000"
        label.font = .preferredFont(forTextStyle: .title3)
        label.numberOfLines = 1
        
        return label
    }()
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss:SSS"
        
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureLayout()
        configureUI()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateWaitingCustomer),
                                               name: .workingNoti,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateCompleteCustomer),
                                               name: .completeNoti,
                                               object: nil)
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
        resetButton.setTitle("초기화", for: .normal)
        resetButton.setTitleColor(.red, for: .normal)
        waitingStackView.createTitleLabel("대기중", backgroundColor: .systemGreen)
        workingStackView.createTitleLabel("업무중", backgroundColor: .systemIndigo)
        addCustomerButton.addTarget(self, action: #selector(didTapAddCustomerButton), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(didTapResetButton), for: .touchUpInside)
    }
    
    private func configureTimer() {
        if timer != nil {
            return
        }
        
        timer = DispatchSource.makeTimerSource(queue: .global())
        timer?.schedule(deadline: .now(), repeating: .milliseconds(77))
        
        timer?.setEventHandler(handler: { [self] in
            date = date.addingTimeInterval(0.077)
            
            DispatchQueue.main.async { [self] in
                workTimeLabel.text = "업무시간 - \(dateFormatter.string(from: date))"
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
    }
    
    @objc func updateWaitingCustomer(_ noti: Notification) {
        guard let customer = noti.object as? Customer else {
            return
        }
        
        DispatchQueue.global().async { [self] in
            DispatchQueue.main.async { [self] in
                waitingStackView.removeLabel(customer: customer)
                workingStackView.addLabel(customer: customer)
            }
        }
    }
    
    @objc func updateCompleteCustomer(_ noti: Notification) {
        guard let customer = noti.object as? Customer else {
            return
        }
        
        DispatchQueue.global().async { [self] in
            DispatchQueue.main.async { [self] in
                workingStackView.removeLabel(customer: customer)
            }
        }
        
        Bank.workingGroup.notify(queue: .global()) { [self] in
            if isRunningTimer == true {
                timer?.suspend()
                isRunningTimer = false
            }
        }
    }
    
    @objc private func didTapResetButton() {
        timer?.cancel()
        timer = nil
        date = Date(timeIntervalSince1970: 0)
        workTimeLabel.text = "업무시간 - 00:00:000"
        bank = Bank()
        waitingStackView.resetLabel()
        workingStackView.resetLabel()
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
            stackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
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
