//
//  BankManagerUIApp - BankViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class BankViewController: UIViewController {
    private let baseVerticalStackView = UIStackView()
    private let buttonsStackView = UIStackView()
    private let timerStackView = UIStackView()
    private let bankStatusStackView = UIStackView()
    private let scrollsStackView = UIStackView()
    private let waitingScrollView = UIScrollView()
    private let workingScrollView = UIScrollView()
    private let waitingStackView = UIStackView()
    private let workingStackView = UIStackView()
    private let bank = Bank(numberOfDepositBankers: 2, numberOfLoanBankers: 1)
    private var totalClient: Int = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bank.delegate = self
        configureBankView()
    }
    
    @objc func addClientButtonDidTap() {
        (1...10).forEach { number in
            bank.lineUp(Client(waitingNumber: totalClient + number, task: Task.random))
        }
        totalClient += 10
        bank.start()
    }
}

//MARK: - View Configuration

extension BankViewController {
    private func configureBankView() {
        view.backgroundColor = .white
        configureBaseVerticalStackView()
        configureButtonsStackview()
        configureTimerStackView()
        configureBankStatusStackView()
        configureScrollsStackView()
    }
    
    private func configureBaseVerticalStackView() {
        let safeArea = view.safeAreaLayoutGuide
        
        baseVerticalStackView.axis = .vertical
        baseVerticalStackView.spacing = 15
        baseVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(baseVerticalStackView)
        
        NSLayoutConstraint.activate([
            baseVerticalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            baseVerticalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            baseVerticalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            baseVerticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureButtonsStackview() {
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        
        let addClientsButton = BankUIComponent.makeButton(text: "고객 10명 추가",
                                                          textColor: .systemBlue)
        addClientsButton.addTarget(self, action: #selector(addClientButtonDidTap), for: .touchUpInside)
        
        let resetButton = BankUIComponent.makeButton(text: "초기화",
                                                     textColor: .systemRed)
        buttonsStackView.addArrangedSubview(addClientsButton)
        buttonsStackView.addArrangedSubview(resetButton)
        baseVerticalStackView.addArrangedSubview(buttonsStackView)
    }
    
    private func configureTimerStackView() {
        timerStackView.axis = .horizontal
        timerStackView.distribution = .fillEqually
        timerStackView.spacing = 5
        timerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let timerLeftLabel = BankUIComponent.makeLabel(text: "업무 시간 -", textStyle: .title2)
        let timerRightLabel = BankUIComponent.makeLabel(text: "00:00:000", textStyle: .title2)
        timerLeftLabel.textAlignment = .right
        timerRightLabel.textAlignment = .left
        timerStackView.addArrangedSubview(timerLeftLabel)
        timerStackView.addArrangedSubview(timerRightLabel)
        baseVerticalStackView.addArrangedSubview(timerStackView)
    }
    
    private func configureBankStatusStackView() {
        bankStatusStackView.axis = .horizontal
        bankStatusStackView.distribution = .fillEqually
        bankStatusStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let waitingLabel = BankUIComponent.makeLabel(text: "대기중",
                                                     textStyle: .largeTitle,
                                                     textColor: .white,
                                                     backgroundColor: .systemGreen)
        let workingLabel = BankUIComponent.makeLabel(text: "업무중",
                                                     textStyle: .largeTitle,
                                                     textColor: .white,
                                                     backgroundColor: .systemIndigo)
        bankStatusStackView.addArrangedSubview(waitingLabel)
        bankStatusStackView.addArrangedSubview(workingLabel)
        baseVerticalStackView.addArrangedSubview(bankStatusStackView)
    }
    
    private func configureScrollsStackView() {
        scrollsStackView.axis = .horizontal
        scrollsStackView.distribution = .fillEqually
        configureWaitingScrollView()
        configureWorkingScrollView()
        baseVerticalStackView.addArrangedSubview(scrollsStackView)
    }
    
    private func configureWaitingScrollView() {
        waitingScrollView.showsHorizontalScrollIndicator = false
        waitingScrollView.translatesAutoresizingMaskIntoConstraints = false
        waitingStackView.translatesAutoresizingMaskIntoConstraints = false
        waitingStackView.axis = .vertical
        waitingStackView.spacing = 10
        waitingScrollView.addSubview(waitingStackView)
        
        NSLayoutConstraint.activate([
            waitingStackView.topAnchor.constraint(equalTo: waitingScrollView.contentLayoutGuide.topAnchor),
            waitingStackView.bottomAnchor.constraint(equalTo: waitingScrollView.contentLayoutGuide.bottomAnchor),
            waitingStackView.widthAnchor.constraint(equalTo: waitingScrollView.widthAnchor)
        ])
        scrollsStackView.addArrangedSubview(waitingScrollView)
    }
    
    private func configureWorkingScrollView() {
        workingScrollView.showsHorizontalScrollIndicator = false
        workingScrollView.translatesAutoresizingMaskIntoConstraints = false
        workingStackView.translatesAutoresizingMaskIntoConstraints = false
        workingStackView.axis = .vertical
        workingStackView.spacing = 10
        workingScrollView.addSubview(workingStackView)
        
        NSLayoutConstraint.activate([
            workingStackView.topAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.topAnchor),
            workingStackView.bottomAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.bottomAnchor),
            workingStackView.widthAnchor.constraint(equalTo: workingScrollView.widthAnchor)
        ])
        scrollsStackView.addArrangedSubview(workingScrollView)
    }
}

//MARK: - BankStateDisplayer Requirement

extension BankViewController: BankStateDisplayer {

    func bank(willBeginServiceFor number: Int, task: String) {
        DispatchQueue.main.sync {
            guard let upcomingClientLabel = self.waitingStackView.subviews.filter({ label in
                label.tag == number
            }).first else { return }
            upcomingClientLabel.removeFromSuperview()
            self.workingStackView.addArrangedSubview(upcomingClientLabel)
        }
    }
    
    func bank(didEndServiceFor number: Int, task: String) {
        DispatchQueue.main.sync {
            guard let exitingClientLabel = self.workingStackView.subviews.filter({ label in
                label.tag == number
            }).first else { return }
            exitingClientLabel.removeFromSuperview()
        }
    }
    
    func bank(didReceiveDepositClientOf number: Int) {
        let depositClientLabel = BankUIComponent.makeLabel(text: "\(number) - \(Task.deposit.rawValue)", textStyle: .title3)
        depositClientLabel.tag = number
        waitingStackView.addArrangedSubview(depositClientLabel)
    }
    
    func bank(didReceiveLoanClientOf number: Int) {
        let loanClientLabel = BankUIComponent.makeLabel(text: "\(number) - \(Task.loan.rawValue)", textStyle: .title3, textColor: .systemPurple)
        loanClientLabel.tag = number
        waitingStackView.addArrangedSubview(loanClientLabel)
    }
}
