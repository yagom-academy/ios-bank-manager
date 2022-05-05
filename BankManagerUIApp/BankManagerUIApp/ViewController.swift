//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

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
        
        return stackView
    }()
    
    let workingVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(baseVerticalStackView)
        
        // Buttons
        buttonHorizontalStackView.addArrangedSubview(addCustomerButton)
        buttonHorizontalStackView.addArrangedSubview(clearButton)
        labelHorizontalStackView.addArrangedSubview(waitingLabel)
        labelHorizontalStackView.addArrangedSubview(workingLabel)
        
        baseVerticalStackView.addArrangedSubview(buttonHorizontalStackView)
        baseVerticalStackView.addArrangedSubview(workTimeLabel)
        baseVerticalStackView.addArrangedSubview(labelHorizontalStackView)
        
        //
        let testLabel1: UILabel = UILabel()
        testLabel1.text = "1-대출"
        let testLabel2: UILabel = UILabel()
        testLabel2.text = "2-대출"
        
        waitingVerticalStackView.addArrangedSubview(testLabel2)
        
        for _ in 1...50 {
            waitingVerticalStackView.addArrangedSubview(returnLabel())
        }
        
        waitingScrollView.addSubview(waitingVerticalStackView)
        taskQueueHorizontalStackView.addArrangedSubview(waitingScrollView)

        
        waitingVerticalStackView.centerXAnchor.constraint(equalTo: waitingScrollView.centerXAnchor).isActive = true
        waitingVerticalStackView.topAnchor.constraint(equalTo: waitingScrollView.topAnchor).isActive = true
        waitingScrollView.topAnchor.constraint(equalTo: taskQueueHorizontalStackView.topAnchor).isActive = true
        waitingScrollView.bottomAnchor.constraint(equalTo: taskQueueHorizontalStackView.bottomAnchor).isActive = true
        
        workingVerticalStackView.addArrangedSubview(testLabel1)
        workingScrollView.addSubview(workingVerticalStackView)
        taskQueueHorizontalStackView.addArrangedSubview(workingScrollView)
        
        workingVerticalStackView.centerXAnchor.constraint(equalTo: workingScrollView.centerXAnchor).isActive = true
        workingVerticalStackView.topAnchor.constraint(equalTo: workingScrollView.topAnchor).isActive = true
        workingScrollView.topAnchor.constraint(equalTo: taskQueueHorizontalStackView.topAnchor).isActive = true
        workingScrollView.bottomAnchor.constraint(equalTo: taskQueueHorizontalStackView.bottomAnchor).isActive = true
        
        baseVerticalStackView.addArrangedSubview(taskQueueHorizontalStackView)
        //
        
        baseVerticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        baseVerticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        baseVerticalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        baseVerticalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        baseVerticalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
    }
    
    func returnLabel() -> UILabel {
        let label = UILabel()
        label.text = "테스트라벨"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }
}

