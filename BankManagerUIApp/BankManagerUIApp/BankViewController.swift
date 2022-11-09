//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class BankViewController: UIViewController {

    private let clientAddButton: UIButton = {
        var button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.addTarget(self, action: #selector(addClient), for: .touchUpInside)
        return button
    }()
    
    private let clearButton: UIButton = {
        var button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.addTarget(self, action: #selector(resetData), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [clientAddButton, clearButton])
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let timeLabel: UILabel = {
        var label = UILabel()
        label.text = "업무시간 - \(Date())"
        label.font = .preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var topStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [buttonStackView, timeLabel])
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let waitingLabel: UILabel = {
        var label = UILabel()
        label.text = "대기중"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .systemGreen
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let waitingStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.spacing = 7
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let waitingScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var leftStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [waitingLabel, waitingScrollView])
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTopStackView()
        setupScrollView()
    }
    
    @objc func addClient() {
        
    }
    
    @objc func resetData() {
        
    }
}

extension BankViewController {
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupTopStackView() {
        view.addSubview(topStackView)
        setupTopStackViewConstraint()
        
    }
    
    private func setupScrollView() {
        waitingScrollView.addSubview(waitingStackView)
        view.addSubview(leftStackView)
        setupLeftScrollViewConstraint()
        
        for _ in 0...40 {
            let testLabel: UILabel = {
                var label = UILabel()
                label.text = "Test"
                label.textColor = .white
                label.textAlignment = .center
                label.adjustsFontForContentSizeCategory = true
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            waitingStackView.addArrangedSubview(testLabel)
        }
    }
    
    private func setupTopStackViewConstraint() {
        NSLayoutConstraint.activate([
            buttonStackView.widthAnchor.constraint(equalTo: topStackView.widthAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 40),
            
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topStackView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setupLeftScrollViewConstraint() {
        let safeAreaFrame = self.view.safeAreaLayoutGuide.layoutFrame
        NSLayoutConstraint.activate([
            
            waitingLabel.widthAnchor.constraint(equalToConstant: safeAreaFrame.width * 0.5),
            waitingLabel.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
            
            leftStackView.topAnchor.constraint(equalTo: waitingLabel.topAnchor),
            leftStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            leftStackView.widthAnchor.constraint(equalTo: waitingLabel.widthAnchor),
            leftStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            waitingScrollView.frameLayoutGuide.topAnchor.constraint(equalTo: waitingLabel.bottomAnchor),
            waitingScrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            waitingScrollView.frameLayoutGuide.widthAnchor.constraint(equalTo: leftStackView.widthAnchor),
            waitingScrollView.contentLayoutGuide.topAnchor.constraint(equalTo: waitingStackView.topAnchor),
            waitingScrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: waitingStackView.bottomAnchor),
            waitingStackView.widthAnchor.constraint(equalTo: waitingScrollView.widthAnchor)
        ])
    }
}
