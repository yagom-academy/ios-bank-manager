//
//  BankManagerView.swift
//  BankManagerUIApp
//
//  Created by Erick, Serena on 2023/07/19.
//

import UIKit

final class BankManagerView: UIView {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let addCustomerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        return button
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        return button
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "업무시간 - "
        return label
    }()
    
    private let waitAndWorkStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let waitLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.backgroundColor = .systemGreen
        label.text = "대기중"
        return label
    }()
    
    private let workLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.backgroundColor = .systemIndigo
        label.text = "업무중"
        return label
    }()
    
    private let waitStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let workStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func configureUI() {
        [addCustomerButton, clearButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        [waitLabel, workLabel].forEach {
            waitAndWorkStackView.addArrangedSubview($0)
        }
        
        contentView.addSubview(workStackView)
        contentView.addSubview(waitStackView)
        contentView.addSubview(waitAndWorkStackView)
        contentView.addSubview(timerLabel)
        contentView.addSubview(buttonStackView)
        scrollView.addSubview(contentView)
        self.addSubview(scrollView)
    }
    
    private func setUpConstraints() {
        setUpScrollViewConstraints()
        setUpContentViewConstraints()
        setUpButtonStackViewConstraints()
        setUpTimerLabelConstraints()
        setUpWaitAndWorkStackViewConstraints()
    }
}

// MARK: - Constraints
extension BankManagerView {
    private func setUpScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setUpContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, multiplier: 1)
        ])
        
        let contentViewHeightConstraints = contentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor, constant: 1)
        contentViewHeightConstraints.priority = .init(1)
        contentViewHeightConstraints.isActive = true
    }
    
    private func setUpButtonStackViewConstraints() {
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            buttonStackView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
    
    private func setUpTimerLabelConstraints() {
        NSLayoutConstraint.activate([
            timerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            timerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            timerLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 20)
        ])
    }
    
    private func setUpWaitAndWorkStackViewConstraints() {
        NSLayoutConstraint.activate([
            waitAndWorkStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            waitAndWorkStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            waitAndWorkStackView.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 20)
        ])
    }
    
    private func setUpWaitStackViewConstraints() {
        NSLayoutConstraint.activate([
            waitStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            waitStackView.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
            waitStackView.topAnchor.constraint(equalTo: waitAndWorkStackView.bottomAnchor, constant: 20),
            waitStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16)
        ])
    }
    
    private func setUpWorkStackViewConstraints() {
        NSLayoutConstraint.activate([
            workStackView.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            workStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            workStackView.topAnchor.constraint(equalTo: waitAndWorkStackView.bottomAnchor, constant: 20),
            workStackView.bottomAnchor.constraint(equalTo: waitStackView.bottomAnchor)
        ])
    }
}
