//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class BankViewController: UIViewController {

    // MARK: - UI Componet
    // MARK: - Top StackView
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
        stackView.spacing = 0
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
    
    private let waitingStackView: UIStackView = {
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
    
    private let workingStackView: UIStackView = {
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
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let banker: Banker = Banker()
    private var clientQueue: ClientQueue = ClientQueue()
    private var bankManager: BankManager = BankManager()
    
    private lazy var bank: Bank = Bank(banker: banker, queue: clientQueue, bankManager: bankManager)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupStackView()
        setupScrollView()
        addNotification()
    }
    
    @objc func addClient() {
        for _ in 1...10 {
            if let client = bank.updateClientQueue() {
                waitingStackView.addArrangedSubview(makeClientLabel(client))
                
                // Test
                workingStackView.addArrangedSubview(makeClientLabel(client))
            }
        }
        bank.startBankWork()
    }
    
    @objc func resetData() {
        
    }
    
    private func makeClientLabel(_ client: Client) -> UILabel {
        let label = UILabel()
        label.text = "\(client.waitingTicket) - \(client.purpose.name)"
        label.textColor = client.purpose == .deposit ? .black : .systemPurple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func addNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(dispatchWorkingStackView),
                                               name: .workStart,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(deleteWorkingStackView),
                                               name: .workEnd,
                                               object: nil)
    }
    
    @objc func dispatchWorkingStackView(notification: Notification) {
        
    }
    
    @objc func deleteWorkingStackView(notification: Notification) {
        removeLabel(notification)
    }
    
    func removeLabel(_ noti: Notification){
        DispatchQueue.main.async { [weak self] in
            guard let client = noti.userInfo?[ClientNoti.client] as? Client else { return }
            let ticketNumber = client.waitingTicket
            
            guard let labels = self?.workingStackView.arrangedSubviews as? [UILabel] else { return }
            
            guard let textLabel = labels.filter({ label in
                if let text = label.text?.split(separator: " ").first, ticketNumber == Int(text) {
                    return true
                }
                return false
            }).first else { return }
            
            textLabel.removeFromSuperview()
        }
    }
}

extension BankViewController {
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupStackView() {
        view.addSubview(topStackView)
        view.addSubview(middleStackView)
        view.addSubview(bottomStackView)
        
        setupStackViewConstraint()
    }
    
    private func setupScrollView() {
        waitingScrollView.addSubview(waitingStackView)
        workingScrollView.addSubview(workingStackView)
        
        setupScrollViewConstraint()
    }
    
    // MARK: - AutoLayout Constraints
    private func setupStackViewConstraint() {
        NSLayoutConstraint.activate([
            buttonStackView.widthAnchor.constraint(
                equalTo: topStackView.widthAnchor),
            buttonStackView.heightAnchor.constraint(
                equalToConstant: 40),
            
            topStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            topStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topStackView.heightAnchor.constraint(
                equalToConstant: 80),
            
            middleStackView.topAnchor.constraint(
                equalTo: topStackView.bottomAnchor),
            middleStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            middleStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            middleStackView.heightAnchor.constraint(
                equalTo: waitingLabel.heightAnchor),
            
            bottomStackView.topAnchor.constraint(
                equalTo: middleStackView.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomStackView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
