//
//  BankManagerUIApp - BankViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class BankViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBankView()
    }

    func configureBankView() {
        view.backgroundColor = .white
        let safeArea = view.safeAreaLayoutGuide
        
        let baseVerticalStackView = UIStackView()
        baseVerticalStackView.axis = .vertical
        baseVerticalStackView.spacing = 15
        baseVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(baseVerticalStackView)
        baseVerticalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        baseVerticalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        baseVerticalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        let buttonsStackView = UIStackView()
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let addClientsButton = UIButton()
        addClientsButton.setTitle("고객 10명 추가", for: .normal)
        addClientsButton.setTitleColor(.systemBlue, for: .normal)
        addClientsButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        addClientsButton.titleLabel?.adjustsFontForContentSizeCategory = true
        buttonsStackView.addArrangedSubview(addClientsButton)
        
        let resetButton = UIButton()
        resetButton.setTitle("초기화", for: .normal)
        resetButton.setTitleColor(.systemRed, for: .normal)
        resetButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        resetButton.titleLabel?.adjustsFontForContentSizeCategory = true
        buttonsStackView.addArrangedSubview(resetButton)
        
        baseVerticalStackView.addArrangedSubview(buttonsStackView)
        
        let timerStackView = UIStackView()
        timerStackView.axis = .horizontal
        timerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let timerLabel = UILabel()
        timerLabel.text = "업무 시간 - 00:00:000"
        timerLabel.font = .preferredFont(forTextStyle: .title2)
        timerLabel.textAlignment = .center
        timerLabel.adjustsFontForContentSizeCategory = true
        timerStackView.addArrangedSubview(timerLabel)
        
        baseVerticalStackView.addArrangedSubview(timerStackView)
        
        let bankStatusStackView = UIStackView()
        bankStatusStackView.axis = .horizontal
        bankStatusStackView.distribution = .fillEqually
        bankStatusStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let waitingLabel = UILabel()
        waitingLabel.text = "대기중"
        waitingLabel.font = .preferredFont(forTextStyle: .largeTitle)
        waitingLabel.textAlignment = .center
        waitingLabel.adjustsFontForContentSizeCategory = true
        waitingLabel.textColor = .white
        waitingLabel.backgroundColor = .systemGreen
        bankStatusStackView.addArrangedSubview(waitingLabel)
        
        let workingLabel = UILabel()
        workingLabel.text = "업무중"
        workingLabel.font = .preferredFont(forTextStyle: .largeTitle)
        workingLabel.textAlignment = .center
        workingLabel.adjustsFontForContentSizeCategory = true
        workingLabel.textColor = .white
        workingLabel.backgroundColor = .systemIndigo
        bankStatusStackView.addArrangedSubview(workingLabel)
        
        baseVerticalStackView.addArrangedSubview(bankStatusStackView)
    }
}

