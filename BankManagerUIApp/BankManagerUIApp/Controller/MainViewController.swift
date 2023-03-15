//
//  BankManagerUIApp - ViewController.swift
//  Created by 레옹아범, 혜모리. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    private var bank = Bank()
    private let addCustomerButton = CustomButton(type: .system)
    private let resetButton = CustomButton(type: .system)
    private let mainStackView = UIStackView()
    private let billboardStackView = UIStackView()
    private let waitingStackView = QueueStackView()
    private let workingStackView = QueueStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureLayout()
        configureUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateWaitingCustomer), name: .waitWork, object: nil)
    }

    private func configureLayout() {
        configureMainStackView()
        createButtonStackView()
        createWorkTimeLabel()
        configureBillboardStackView()
        configureWaitingStackView()
        configureWorkingStackView()
    }
    
    private func configureUI() {
        addCustomerButton.setTitle("고객 10명 추가", for: .normal)
        resetButton.setTitle("초기화", for: .normal)
        resetButton.setTitleColor(.red, for: .normal)
        waitingStackView.createTitleLabel("대기중", backgroundColor: .systemGreen)
        workingStackView.createTitleLabel("업무중", backgroundColor: .systemIndigo)
        addCustomerButton.addTarget(self, action: #selector(didTapAddCustomerButton), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(didTapResetButton), for: .touchUpInside)
    }
    
    @objc private func didTapAddCustomerButton() {
        DispatchQueue.main.async { [self] in
            for _ in 1...10 {
                guard let customer = bank.addCustomer() else { return }
                waitingStackView.addLabel(customer: customer)
                sleep(1)
            }
        }
        
        bank.open()
    }
    
    @objc func updateWaitingCustomer(_ noti: Notification) {
        guard let customer = noti.object as? Customer else {
            return
        }
        
        DispatchQueue.main.async { [self] in
            waitingStackView.removeLabel(customer: customer)
            workingStackView.addLabel(customer: customer)
        }
    }
    
    @objc private func didTapResetButton() {
        bank = Bank()
        waitingStackView.resetLabel()
        workingStackView.resetLabel()
    }
}

// MARK: - UIStackView
extension MainViewController {
    private func configureMainStackView() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.alignment = .center
        mainStackView.spacing = 16
        
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func createButtonStackView() {
        let stackView = UIStackView(arrangedSubviews: [addCustomerButton, resetButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually

        mainStackView.addArrangedSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
        ])
    }
    
    private func configureBillboardStackView() {
        billboardStackView.translatesAutoresizingMaskIntoConstraints = false
        billboardStackView.axis = .horizontal
        billboardStackView.distribution = .fillEqually
        billboardStackView.alignment = .firstBaseline
        
        mainStackView.addArrangedSubview(billboardStackView)
        
        NSLayoutConstraint.activate([
            billboardStackView.leadingAnchor.constraint(equalTo: mainStackView.safeAreaLayoutGuide.leadingAnchor),
            billboardStackView.trailingAnchor.constraint(equalTo: mainStackView.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func configureWaitingStackView() {
        waitingStackView.translatesAutoresizingMaskIntoConstraints = false
        waitingStackView.axis = .vertical
        waitingStackView.distribution = .fill
        waitingStackView.alignment = .center
        waitingStackView.spacing = 16
        
        billboardStackView.addArrangedSubview(waitingStackView)
    
    }
    
    private func configureWorkingStackView() {
        workingStackView.translatesAutoresizingMaskIntoConstraints = false
        workingStackView.axis = .vertical
        workingStackView.distribution = .fill
        workingStackView.alignment = .center
        workingStackView.spacing = 16
        
        billboardStackView.addArrangedSubview(workingStackView)
    }
}

// MARK: - UILabel
extension MainViewController {
    private func createWorkTimeLabel() {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = false
        label.text = "업무시간 - 04:00:123"
        label.font = .preferredFont(forTextStyle: .title3)
        label.numberOfLines = 1
        
        mainStackView.addArrangedSubview(label)
    }
}
