//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController, SendDelegate {
    
    var bankManager = BankManager()
    let baseVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 15
        
        return stackView
    }()
    
    let buttonHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    let labelHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let taskQueueHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let waitingVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    let workingVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    let addCustomerButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("고객 10명 추가", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    let clearButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("초기화", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    let workTimeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "업무시간 - "
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        
        return label
    }()
    
    let waitingLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "대기중"
        label.textColor = .white
        label.backgroundColor = .systemGreen
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        return label
    }()
    
    let workingLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "업무중"
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        return label
    }()
    
    let waitingScrollView: UIScrollView = UIScrollView()
    let workingScrollView: UIScrollView = UIScrollView()
    
    func addToWaitingList(_ customer: Customer) {
        DispatchQueue.main.async {
            self.waitingVerticalStackView.addArrangedSubview(self.generateLabel(of: customer))
        }
    }
    
    func addToWorkingList(_ customer: Customer) {
        let label = generateLabel(of: customer)
        guard let waitinglabelArray = waitingVerticalStackView.subviews as? [UILabel] else {
            return
        }
        
        DispatchQueue.main.async {
            for waitingLabel in waitinglabelArray {
                if label.text == waitingLabel.text {
                    waitingLabel.removeFromSuperview()
                    self.workingVerticalStackView.addArrangedSubview(label)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bankManager.bank.delegate = self
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(baseVerticalStackView)
        
        buttonHorizontalStackView.addArrangedSubview(addCustomerButton)
        buttonHorizontalStackView.addArrangedSubview(clearButton)
        labelHorizontalStackView.addArrangedSubview(waitingLabel)
        labelHorizontalStackView.addArrangedSubview(workingLabel)
        
        baseVerticalStackView.addArrangedSubview(buttonHorizontalStackView)
        baseVerticalStackView.addArrangedSubview(workTimeLabel)
        baseVerticalStackView.addArrangedSubview(labelHorizontalStackView)
        
        //
        
        waitingScrollView.addSubview(waitingVerticalStackView)
        taskQueueHorizontalStackView.addArrangedSubview(waitingScrollView)
        
        workingScrollView.addSubview(workingVerticalStackView)
        taskQueueHorizontalStackView.addArrangedSubview(workingScrollView)
        
        baseVerticalStackView.addArrangedSubview(taskQueueHorizontalStackView)
        
        
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
        
        addCustomerButton.addTarget(self, action: #selector(execution(_:)), for: .touchUpInside)
    }
    
    @objc func execution(_ sender: UIButton) {
        DispatchQueue.global().async {
            self.bankManager.startBanking()
        }
    }
    
    func generateLabel(of customer: Customer) -> UILabel {
        let label = UILabel()
        guard let task = customer.bankingType else {
            return UILabel()
        }
        
        label.text = "\(customer.number)-\(task.rawValue)"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        if task == .loan {
            label.textColor = .systemPurple
        }
        
        return label
    }
    
    func addLabelToWaitingQueue(of customer: Customer) {
        waitingVerticalStackView.addArrangedSubview(generateLabel(of: customer))
    }
}

