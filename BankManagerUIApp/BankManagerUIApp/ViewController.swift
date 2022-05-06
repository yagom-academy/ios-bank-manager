//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController, SendDelegate {
    
    private var bankManager = BankManager()
    
    private let waitingScrollView: UIScrollView = UIScrollView()
    private let workingScrollView: UIScrollView = UIScrollView()

    private let baseVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 15
        
        return stackView
    }()
    
    private let buttonHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let timerHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        return stackView
    }()
    
    private let labelHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let taskQueueHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let waitingVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let workingVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let addCustomerButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("고객 10명 추가", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return button
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("초기화", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return button
    }()
    
    private let workTimeTitleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "업무시간 - "
        label.textAlignment = .right
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        
        return label
    }()
    
    private let workTimeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00:000"
        label.textAlignment = .left
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        
        return label
    }()
    
    private let waitingLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "대기중"
        label.textColor = .white
        label.backgroundColor = .systemGreen
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        return label
    }()
    
    private let workingLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "업무중"
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        return label
    }()
}

// MARK: - View Life Cycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bankManager.bank.delegate = self
        configureViewStructure()
        configureConstraints()
        addCustomerButton.addTarget(self, action: #selector(execution(_:)), for: .touchUpInside)
    }
}

// MARK: - Private Method
extension ViewController {
    private func configureViewStructure() {
        view.addSubview(baseVerticalStackView)
        buttonHorizontalStackView.addArrangedSubview(addCustomerButton)
        buttonHorizontalStackView.addArrangedSubview(clearButton)
        labelHorizontalStackView.addArrangedSubview(waitingLabel)
        labelHorizontalStackView.addArrangedSubview(workingLabel)
        timerHorizontalStackView.addArrangedSubview(workTimeTitleLabel)
        timerHorizontalStackView.addArrangedSubview(workTimeLabel)
        baseVerticalStackView.addArrangedSubview(buttonHorizontalStackView)
        baseVerticalStackView.addArrangedSubview(timerHorizontalStackView)
        baseVerticalStackView.addArrangedSubview(labelHorizontalStackView)
        waitingScrollView.addSubview(waitingVerticalStackView)
        taskQueueHorizontalStackView.addArrangedSubview(waitingScrollView)
        workingScrollView.addSubview(workingVerticalStackView)
        taskQueueHorizontalStackView.addArrangedSubview(workingScrollView)
        baseVerticalStackView.addArrangedSubview(taskQueueHorizontalStackView)
    }
    
    private func configureConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            waitingVerticalStackView.centerXAnchor.constraint(equalTo: waitingScrollView.centerXAnchor),
            waitingVerticalStackView.topAnchor.constraint(equalTo: waitingScrollView.topAnchor),
            waitingScrollView.topAnchor.constraint(equalTo: taskQueueHorizontalStackView.topAnchor),
            waitingVerticalStackView.bottomAnchor.constraint(equalTo: waitingScrollView.bottomAnchor),
            
            workingVerticalStackView.centerXAnchor.constraint(equalTo: workingScrollView.centerXAnchor),
            workingVerticalStackView.topAnchor.constraint(equalTo: workingScrollView.topAnchor),
            workingScrollView.topAnchor.constraint(equalTo: taskQueueHorizontalStackView.topAnchor),
            workingVerticalStackView.bottomAnchor.constraint(equalTo: workingScrollView.bottomAnchor),
            
            baseVerticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            baseVerticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            baseVerticalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            baseVerticalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            baseVerticalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    private func removeLabel(from stackView: UIStackView, _ customer: Customer) {
        guard let task = customer.bankingType else {
            return
        }
        let text = "\(customer.number) - \(task.rawValue)"
        
        DispatchQueue.main.async {
            guard let labelArray = stackView.subviews as? [UILabel] else {
                return
            }
            
            labelArray.filter { $0.text == text }[0].removeFromSuperview()
        }
    }
    
    @objc private func execution(_ sender: UIButton) {
        let group = DispatchGroup()
        DispatchQueue.global().async(group: group) {
            self.bankManager.startBanking()
        }
        group.notify(queue: .main) {
            self.bankManager.status = .notRunning
        }
    }
    
    private func generateLabel(of customer: Customer) -> UILabel {
        let label = UILabel()
        guard let task = customer.bankingType else {
            return UILabel()
        }
        
        label.text = "\(customer.number) - \(task.rawValue)"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        if task == .loan {
            label.textColor = .systemPurple
        }
        
        return label
    }
}

// MARK: - Delegate Method
extension ViewController {
    func addToWaitingList(_ customer: Customer) {
        DispatchQueue.main.async {
            self.waitingVerticalStackView.addArrangedSubview(self.generateLabel(of: customer))
        }
    }
    
    func addToWorkingList(_ customer: Customer) {
        DispatchQueue.main.async {
            self.removeLabel(from: self.waitingVerticalStackView, customer)
            self.workingVerticalStackView.addArrangedSubview(self.generateLabel(of: customer))
        }
    }
    
    func removeFromWorkingList(_ customer: Customer) {
        DispatchQueue.main.async {
            self.removeLabel(from: self.workingVerticalStackView, customer)
        }
    }
}
