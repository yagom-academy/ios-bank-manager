//
//  BankView.swift
//  BankManagerUIApp
//
//  Created by Kyo, Wonbi on 2022/11/10.
//

import UIKit

final class BankView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupStackView()
        setupScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Top StackView
    let buttonStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.spacing = .zero
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let timeLabel: UILabel = {
        var label = UILabel()
        label.text = "업무시간 - 00:00:000"
        label.font = .preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var topStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [buttonStackView, timeLabel])
        stackView.spacing = .zero
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Middle StackView
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
    
    private let workingLabel: UILabel = {
        var label = UILabel()
        label.text = "업무중"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .systemPurple
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var middleStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [waitingLabel, workingLabel])
        stackView.spacing = .zero
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Bottom StackView
    private let waitingScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let waitingStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.spacing = 7
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let workingScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let workingStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.spacing = 7
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var bottomStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [waitingScrollView, workingScrollView])
        stackView.spacing = .zero
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
}

// MARK: - AutoLayout Constraints
extension BankView {
    private func setupStackView() {
        self.addSubview(topStackView)
        self.addSubview(middleStackView)
        self.addSubview(bottomStackView)
        
        setupStackViewConstraint()
    }
    
    private func setupScrollView() {
        waitingScrollView.addSubview(waitingStackView)
        workingScrollView.addSubview(workingStackView)
        
        setupScrollViewConstraint()
    }
    
    private func setupStackViewConstraint() {
        NSLayoutConstraint.activate([
            buttonStackView.widthAnchor.constraint(
                equalTo: topStackView.widthAnchor),
            buttonStackView.heightAnchor.constraint(
                equalToConstant: 40),
            
            topStackView.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor),
            topStackView.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            topStackView.trailingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            topStackView.heightAnchor.constraint(
                equalToConstant: 80),
            
            middleStackView.topAnchor.constraint(
                equalTo: topStackView.bottomAnchor),
            middleStackView.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            middleStackView.trailingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            middleStackView.heightAnchor.constraint(
                equalTo: waitingLabel.heightAnchor),
            
            bottomStackView.topAnchor.constraint(
                equalTo: middleStackView.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            bottomStackView.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupScrollViewConstraint() {
        NSLayoutConstraint.activate([
            waitingScrollView.contentLayoutGuide.heightAnchor.constraint(
                equalTo: waitingStackView.heightAnchor),
            waitingScrollView.contentLayoutGuide.widthAnchor.constraint(
                equalTo: waitingStackView.widthAnchor),
            
            workingScrollView.contentLayoutGuide.heightAnchor.constraint(
                equalTo: workingStackView.heightAnchor),
            workingScrollView.contentLayoutGuide.widthAnchor.constraint(
                equalTo: workingStackView.widthAnchor),
            
            waitingScrollView.frameLayoutGuide.heightAnchor.constraint(
                equalTo: bottomStackView.heightAnchor),
            waitingScrollView.frameLayoutGuide.widthAnchor.constraint(
                equalTo: waitingStackView.widthAnchor),
            workingScrollView.frameLayoutGuide.heightAnchor.constraint(
                equalTo: bottomStackView.heightAnchor),
            workingScrollView.frameLayoutGuide.widthAnchor.constraint(
                equalTo: workingStackView.widthAnchor)
        ])
    }
}
