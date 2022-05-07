//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class BankManagerViewController: UIViewController, CustomerSendable {
    
    private var bankManager = BankManager()
    
    private let waitingScrollView: UIScrollView = UIScrollView()
    private let workingScrollView: UIScrollView = UIScrollView()
    
    private lazy var baseVerticalStackView: UIStackView = makeStackView(axis: .vertical, alignment: .fill, distribution: .fill, spacing: 15)
    private lazy var buttonHorizontalStackView: UIStackView = makeStackView(axis: .horizontal, alignment: .fill, distribution: .fillEqually, spacing: 10)
    private lazy var timerHorizontalStackView: UIStackView = makeStackView(axis: .horizontal, alignment: .fill, distribution: .fillEqually, spacing: 5)
    private lazy var labelHorizontalStackView: UIStackView = makeStackView(axis: .horizontal, alignment: .fill, distribution: .fillEqually, spacing: 0)
    private lazy var taskQueueHorizontalStackView: UIStackView = makeStackView(axis: .horizontal, alignment: .fill, distribution: .fillEqually, spacing: 0)
    private lazy var waitingVerticalStackView: UIStackView = makeStackView(axis: .vertical, alignment: .center, distribution: .fillEqually, spacing: 10)
    private lazy var workingVerticalStackView: UIStackView = makeStackView(axis: .vertical, alignment: .center, distribution: .fillEqually, spacing: 10)
    
    private let addCustomerButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("고객 10명 추가", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return button
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("초기화", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return button
    }()
    
    private let workTimeTitleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "업무시간 - "
        label.textAlignment = .right
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        
        return label
    }()
    
    private let workTimeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00:000"
        label.textAlignment = .left
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        
        return label
    }()
    
    private let waitingLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "대기중"
        label.textColor = .white
        label.backgroundColor = .systemGreen
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        return label
    }()
    
    private let workingLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "업무중"
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        return label
    }()
    
    var startTime = Date()
    var durationTime: TimeInterval = 0
    var timer: DispatchSourceTimer?
    var currentTimerState: TimerState = .timerNotRunning
}

// MARK: - View Life Cycle
extension BankManagerViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bankManager.bank.delegate = self
        configureViewStructure()
        configureConstraints()
        addCustomerButton.addTarget(self, action: #selector(execution(_:)), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clear(_:)), for: .touchUpInside)
    }
}

// MARK: - Private Method
extension BankManagerViewController {
    private func configureViewStructure() {
        view.addSubview(baseVerticalStackView)

        baseVerticalStackView.addArrangedSubview(buttonHorizontalStackView)
        baseVerticalStackView.addArrangedSubview(timerHorizontalStackView)
        baseVerticalStackView.addArrangedSubview(labelHorizontalStackView)
        baseVerticalStackView.addArrangedSubview(taskQueueHorizontalStackView)

        buttonHorizontalStackView.addArrangedSubview(addCustomerButton)
        buttonHorizontalStackView.addArrangedSubview(clearButton)
        
        labelHorizontalStackView.addArrangedSubview(waitingLabel)
        labelHorizontalStackView.addArrangedSubview(workingLabel)
        
        timerHorizontalStackView.addArrangedSubview(workTimeTitleLabel)
        timerHorizontalStackView.addArrangedSubview(workTimeLabel)
        
        waitingScrollView.addSubview(waitingVerticalStackView)
        workingScrollView.addSubview(workingVerticalStackView)

        taskQueueHorizontalStackView.addArrangedSubview(waitingScrollView)
        taskQueueHorizontalStackView.addArrangedSubview(workingScrollView)
    }
    
    private func configureConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            waitingScrollView.topAnchor.constraint(equalTo: taskQueueHorizontalStackView.topAnchor),
            waitingVerticalStackView.centerXAnchor.constraint(equalTo: waitingScrollView.centerXAnchor),
            waitingVerticalStackView.topAnchor.constraint(equalTo: waitingScrollView.topAnchor),
            waitingVerticalStackView.bottomAnchor.constraint(equalTo: waitingScrollView.bottomAnchor),

            workingScrollView.topAnchor.constraint(equalTo: taskQueueHorizontalStackView.topAnchor),
            workingVerticalStackView.centerXAnchor.constraint(equalTo: workingScrollView.centerXAnchor),
            workingVerticalStackView.topAnchor.constraint(equalTo: workingScrollView.topAnchor),
            workingVerticalStackView.bottomAnchor.constraint(equalTo: workingScrollView.bottomAnchor),
            
            baseVerticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            baseVerticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            baseVerticalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            baseVerticalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            baseVerticalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    private func removeLabel(from stackView: UIStackView, _ customer: Customer) {
        guard let task = customer.bankingType else {
            return
        }
        
        let text = "\(customer.number) - \(task.rawValue)"
        
        DispatchQueue.main.async {
            guard let labelArray = stackView.subviews as? [UILabel] else {
                return
            }
            
            labelArray.filter { $0.text == text }.first?.removeFromSuperview()
        }
    }
    
    @objc private func execution(_ sender: UIButton) {
        let group = DispatchGroup()
        
        DispatchQueue.global().async(group: group) {
            if self.currentTimerState != .timerRunning {
                self.startTimer()
            }
            self.bankManager.startBanking()
        }
        
        group.notify(queue: .main) {
            if self.bankManager.status == .notRunning {
                self.pauseTimer()
            }
        }
    }
    
    @objc private func clear(_ sender: UIButton) {
        self.bankManager.bank.clearCustomerQueue()
        self.bankManager.status = .notRunning

        guard let waitings = waitingVerticalStackView.subviews as? [UILabel] else {
            return
        }
        
        guard let workings = workingVerticalStackView.subviews as? [UILabel] else {
            return
        }
        
        DispatchQueue.main.async {
            waitings.forEach({
                $0.removeFromSuperview()
            })
            workings.forEach({
                $0.removeFromSuperview()
            })
        }
        
        clearTimer()
    }
    
    private func generateLabel(of customer: Customer) -> UILabel {
        let label = UILabel()
        guard let task = customer.bankingType else {
            return UILabel()
        }
        
        label.text = "\(customer.number) - \(task.rawValue)"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        if task == .loan {
            label.textColor = .systemPurple
        }
        
        return label
    }
    
    private func makeStackView(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.spacing = spacing
        
        return stackView
    }
    
    private func makeButton(title: String, font: UIFont, color: UIColor) -> UIButton {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = font
        button.setTitleColor(color, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return button
    }
}

// MARK: - Delegate Method
extension BankManagerViewController {
    func addToWaitingList(_ customer: Customer) {
        DispatchQueue.main.async {
            self.waitingVerticalStackView.addArrangedSubview(self.generateLabel(of: customer))
        }
    }
    
    func addToWorkingList(_ customer: Customer) {
        DispatchQueue.main.async {
            self.removeLabel(from: self.waitingVerticalStackView, customer)
            self.workingVerticalStackView.addArrangedSubview(self.generateLabel(of: customer))
        }
    }
    
    func removeFromWorkingList(_ customer: Customer) {
        DispatchQueue.main.async {
            self.removeLabel(from: self.workingVerticalStackView, customer)
        }
    }
}

// MARK: - Timer
extension BankManagerViewController {
    enum TimerState {
        case timerRunning
        case timerPaused
        case timerNotRunning
    }
    
    private func startTimer() {
        startTime = Date()
        if timer == nil {
            timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
            timer?.schedule(deadline: .now(), repeating: 0.01)
            timer?.setEventHandler(handler: {
                self.updateWorkTimeLabel()
            })
        }
        
        if currentTimerState != .timerRunning {
            currentTimerState = .timerRunning
            timer?.resume()
        }
    }
    
    private func pauseTimer() {
        currentTimerState = .timerPaused
        timer?.suspend()
        let timeInterval = Date().timeIntervalSince(self.startTime)
        durationTime += timeInterval
    }
    
    private func clearTimer() {
        if currentTimerState != .timerRunning {
            timer?.resume()
        }
        
        timer?.cancel()
        currentTimerState = .timerNotRunning
        timer = nil
        workTimeLabel.text = "00:00:000"
        durationTime = 0
    }
    
    private func updateWorkTimeLabel() {
        let timeInterval = Date().timeIntervalSince(self.startTime)
        let durationSeconds = durationTime + timeInterval
        let second = (Int)(fmod(durationSeconds, 60))
        let decimalValue = (Int)(floor((durationSeconds - floor(durationSeconds)) * 100000))
        let milliSecond = (Int)(decimalValue / 1000)
        let microSecond = (Int)(decimalValue % 1000)
        self.workTimeLabel.text = "\(String(format: "%02d", second)):\(String(format: "%02d", milliSecond)):\(String(format:"%03d", microSecond))"
    }
}
