//
//  BankViewController.swift
//  BankManagerUIApp
//
//  Created by kyungmin, Max on 2023/07/20.
//

import UIKit

protocol BankViewControllerDelegate: AnyObject {
    func addWaitingQueue(_ customer: Customer)
    func moveCustomerToProcessQueue(_ customer: Customer)
    func popProcessingQueue(_ customer: Customer)
    func resetUI()
}

final class BankViewController: UIViewController {
    private var bank = Bank()
    private var waitingDictionary: [Customer: CustomerView] = .init()
    private var processingDictionary: [Customer: CustomerView] = .init()

    private var startWorkTime: CFAbsoluteTime?
    private var timer: Timer?
    private var timeInterval: Double = .zero
    
    private let outerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = SpacingSetting.outerStackView
        
        return stackView
    }()
    
    private let menuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let addCustomerButton: UIButton = {
        let button = UIButton()
        button.setTitle(Namespace.addCustomer, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle(Namespace.reset, for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        
        return button
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        
        return label
    }()
    
    private let statusLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        let waitingLabel = UILabel()
        waitingLabel.text = Namespace.waiting
        waitingLabel.backgroundColor = .systemGreen
        waitingLabel.textColor = .white
        waitingLabel.textAlignment = .center
        waitingLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        let processingLabel = UILabel()
        processingLabel.text = Namespace.processing
        processingLabel.backgroundColor = .systemBlue
        processingLabel.textColor = .white
        processingLabel.textAlignment = .center
        processingLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        stackView.addArrangedSubview(waitingLabel)
        stackView.addArrangedSubview(processingLabel)
        
        return stackView
    }()
    
    private let customerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .top
        
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let waitingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = SpacingSetting.customerStackView
        
        return stackView
    }()
    
    private let processingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = SpacingSetting.customerStackView
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bank.delegate = self
        configureUI()
        setTimer(.zero)
        bank.work()
    }
    
    @objc private func didTapAddCustomerButton() {
        setTimer(timeInterval)
        bank.work(totalCustomer: Configuration.addCustomerAmount)
    }
    
    @objc private func didTapResetButton() {
        bank.reset()
    }
    
    @objc private func updateTimerLabel() {
        guard let startTime = startWorkTime else {
            return
        }
        
        timeInterval = CFAbsoluteTimeGetCurrent() - startTime
        timerLabel.text = String(format: Namespace.timer, timeInterval.formatTimeIntervalToString())
    }
    
    private func pauseTimer() {
        timer?.invalidate()
    }
    
    private func setTimer(_ timeInterval: Double) {
        timerLabel.text = String(format: Namespace.timer, timeInterval.formatTimeIntervalToString())
        
        startWorkTime = CFAbsoluteTimeGetCurrent() - timeInterval
        
        guard timer?.isValid == true else {
            timer = Timer.scheduledTimer(timeInterval: Configuration.timeIntervalRepeat,
                                         target: self,
                                         selector: #selector(updateTimerLabel),
                                         userInfo: nil,
                                         repeats: true)
            
            return
        }
    }
}


private extension BankViewController {
    func configureUI() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.backgroundColor = .systemBackground
        view.addSubview(outerStackView)
        
        menuStackView.addArrangedSubview(addCustomerButton)
        menuStackView.addArrangedSubview(resetButton)
        
        customerStackView.addArrangedSubview(waitingStackView)
        customerStackView.addArrangedSubview(processingStackView)
        
        outerStackView.addArrangedSubview(menuStackView)
        outerStackView.addArrangedSubview(timerLabel)
        outerStackView.addArrangedSubview(statusLabelStackView)
        outerStackView.addArrangedSubview(customerStackView)
        
        addCustomerButton.addTarget(self, action: #selector(didTapAddCustomerButton), for: .touchUpInside)
        
        resetButton.addTarget(self, action: #selector(didTapResetButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            outerStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            outerStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
}

extension BankViewController: BankViewControllerDelegate {
    func addWaitingQueue(_ customer: Customer) {
        OperationQueue.main.addOperation {
            let customerView = CustomerView(customer: customer, frame: self.view.frame)
            customerView.configureUI()
            
            self.waitingStackView.addArrangedSubview(customerView)
            self.waitingDictionary[customer] = customerView
        }
    }
    
    func moveCustomerToProcessQueue(_ customer: Customer) {
        if waitingDictionary[customer] == nil {
            OperationQueue.main.waitUntilAllOperationsAreFinished()
        }
        
        guard let customerView = waitingDictionary[customer] else {
            return
        }
        
        OperationQueue.main.addOperation {
            customerView.removeFromSuperview()
            self.waitingDictionary[customer] = nil
            self.processingStackView.addArrangedSubview(customerView)
            self.processingDictionary[customer] = customerView
        }
    }
    
    func popProcessingQueue(_ customer: Customer) {
        guard let customerView = processingDictionary[customer] else {
            return
        }
        
        OperationQueue.main.addOperation {
            customerView.removeFromSuperview()
            self.processingDictionary[customer] = nil
            
            if self.processingDictionary.isEmpty && self.waitingDictionary.isEmpty {
                self.pauseTimer()
            }
        }
    }
    
    func resetUI() {
        processingStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        waitingStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }

        waitingDictionary = .init()
        processingDictionary = .init()
        setTimer(.zero)
    }
}

extension BankViewController {
    enum Configuration {
        static let addCustomerAmount = 10
        static let timeIntervalRepeat = 0.001
    }
    
    enum Namespace {
        static let waiting = "대기중"
        static let processing = "업무중"
        static let addCustomer = "고객 \(Configuration.addCustomerAmount)명 추가"
        static let reset = "초기화"
        static let timer = "업무시간 - %@"
    }
    
    enum SpacingSetting {
        static let outerStackView: CGFloat = 10
        static let customerStackView: CGFloat = 5
    }
}
