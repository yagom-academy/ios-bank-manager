//
//  BankViewController.swift
//  BankManagerUIApp
//
//  Created by kyungmin, Max on 2023/07/20.
//

import UIKit

protocol BankViewControllerDelegate {
    func addWaitingQueue(_ customer: Customer)
    func moveCustomerToProcessQueue(_ customer: Customer)
    func popProcessingQueue(_ customer: Customer)
    func resetUI()
}

class BankViewController: UIViewController {
    private var bank = Bank()
    
    var startWorkTime: Date?
    var timer: Timer?
    var timeInterval: Double = .zero
    
    private let outerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let queueNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        let waitingLabel = UILabel()
        waitingLabel.text = "대기중"
        waitingLabel.backgroundColor = .systemGreen
        waitingLabel.textColor = .white
        waitingLabel.textAlignment = .center
        waitingLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        let processingLabel = UILabel()
        processingLabel.text = "업무중"
        processingLabel.backgroundColor = .systemBlue
        processingLabel.textColor = .white
        processingLabel.textAlignment = .center
        processingLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        stackView.addArrangedSubview(waitingLabel)
        stackView.addArrangedSubview(processingLabel)
        
        processingLabel.widthAnchor.constraint(equalTo: waitingLabel.widthAnchor).isActive = true
        
        return stackView
    }()
    
    private let queueStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .top
        
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let menuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let waitingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    private let processingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    private let addCustomerButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        
        return button
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    @objc private func didTapAddCustomer() {
        bank.work(totalCustomer: 10)
    }
    
    @objc private func didTapReset() {
        bank.reset()
    }
}


extension BankViewController {
    private func configureUI() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(outerStackView)
        
        menuStackView.addArrangedSubview(addCustomerButton)
        menuStackView.addArrangedSubview(resetButton)
        
        queueStackView.addArrangedSubview(waitingStackView)
        queueStackView.addArrangedSubview(processingStackView)
        
        outerStackView.addArrangedSubview(menuStackView)
        outerStackView.addArrangedSubview(timerLabel)
        outerStackView.addArrangedSubview(queueNameStackView)
        outerStackView.addArrangedSubview(queueStackView)
        
        addCustomerButton.addTarget(self, action: #selector(didTapAddCustomer), for: .touchUpInside)
        
        resetButton.addTarget(self, action: #selector(didTapReset), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            outerStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            outerStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
}

