//
//  BankManagerUIApp - BankViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class BankViewController: UIViewController {
    let baseVerticalStackView = UIStackView()
    let buttonsStackView = UIStackView()
    let timerStackView = UIStackView()
    let bankStatusStackView = UIStackView()
    let scrollsStackView = UIStackView()
    let waitingScrollView = UIScrollView()
    let workingScrollView = UIScrollView()
    let waitingStackView = UIStackView()
    let workingStackView = UIStackView()
    let bank = Bank(numberOfDepositBankers: 2, numberOfLoanBankers: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bank.delegate = self
        configureBankView()
    }
    
    func configureBankView() {
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
        let resetButton = BankUIComponent.makeButton(text: "초기화",
                                                     textColor: .systemRed)
        buttonsStackView.addArrangedSubview(addClientsButton)
        buttonsStackView.addArrangedSubview(resetButton)
        baseVerticalStackView.addArrangedSubview(buttonsStackView)
    }
    
    private func configureTimerStackView() {
        timerStackView.axis = .horizontal
        timerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let timerLabel = BankUIComponent.makeLabel(text: "업무 시간 - 00:00:000",
                                                   textStyle: .title2)
        timerStackView.addArrangedSubview(timerLabel)
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

extension BankViewController: BankStateDisplayer {

    func bank(willBeginServiceFor number: Int, task: String) {
        
    }
    
    func bank(didEndServiceFor number: Int, task: String) {
        
    }
    
    func bank(didReceiveDepositClientOf number: Int) {
        let depositClientLabel = BankUIComponent.makeLabel(text: "\(number) - \(Task.deposit.rawValue)", textStyle: .title3)
        waitingStackView.addArrangedSubview(depositClientLabel)
    }
    
    func bank(didReceiveLoanClientOf number: Int) {
        let loanClientLabel = BankUIComponent.makeLabel(text: "\(number) - \(Task.loan.rawValue)", textStyle: .title3)
        workingStackView.addArrangedSubview(loanClientLabel)
    }
}
