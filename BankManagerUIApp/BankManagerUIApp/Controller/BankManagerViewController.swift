//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright Donnie, Safari. All rights reserved.
// 

import UIKit

final class BankManagerViewController: UIViewController {
    private lazy var bankManagerView = BankManagerView.init(frame: self.view.bounds)
    private var bank = Bank(depositClerkCount: 2, loanClerkCount: 1)
    private var timer: Timer?
    private var time: Int = 0 {
        didSet {
            let (minute, second, milliSecond) = translateTime(time)
            self.bankManagerView.taskTimeLabel.text = "업무시간 - \(minute):\(second):\(milliSecond)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        configureView()
        bank.bankClerk.delegate = self
    }
    
    private func configureButtons() {
        bankManagerView.addCustomersButton.addTarget(self, action: #selector(addCustomersButtonTapped), for: .touchUpInside)
        bankManagerView.resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addCustomersButtonTapped() {
        startTimer()
        bank.addCustomers().forEach { customer in
            guard let information = customer.task?.information else { return }
            bankManagerView.waitingVerticalStackView.addArrangedSubview(CustomerView(frame: .zero,
                                                                                     number: customer.numberTicket,
                                                                                     task: information))
        }
    }
    
    @objc private func resetButtonTapped() {
        resetTimer()
        bank.stopOperation()
        bank.resetTicketNumber()
        resetStack()
    }
    
    func resetStack() {
        bankManagerView.waitingVerticalStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }
    
    private func configureView() {
        self.view = bankManagerView
    }
}

// MARK: - Timer Method
private extension BankManagerViewController {
    @objc func timesUp() {
        self.time += 1
    }
    
    func startTimer() {
        guard self.timer == nil else { return }
        self.timer = Timer.scheduledTimer(timeInterval: 0.001,
                                     target: self,
                                     selector: #selector(timesUp),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func resetTimer() {
        self.timer?.invalidate()
        self.timer = nil
        time = 0
    }

    func translateTime(_ time: Int) -> (String, String, String) {
        let minute = String(format: "%02d", (time / (1000 * 60)) % 60)
        let second = String(format: "%02d", ((time / 1000) % 60))
        let milliSecond = String(format: "%03d", (time % 1000))
        return (minute, second, milliSecond)
    }
}

// MARK: - BankDelegate Method
extension BankManagerViewController: BankDelegate {
    func start(customer: Customer) {
        DispatchQueue.main.async {
            self.bankManagerView.waitingVerticalStackView.arrangedSubviews.forEach { view in
                guard let customerView = view as? CustomerView else { return }
                if customerView.number == customer.numberTicket {
                    self.bankManagerView.waitingVerticalStackView.removeArrangedSubview(customerView)
                    self.bankManagerView.workingVerticalStackView.addArrangedSubview(customerView)
                }
            }
        }
    }
    
    func finish(customer: Customer) {
        DispatchQueue.main.async {
            self.bankManagerView.workingVerticalStackView.arrangedSubviews.forEach { view in
                guard let customerView = view as? CustomerView else { return }
                if customerView.number == customer.numberTicket {
                    customerView.removeFromSuperview()
                }
            }
        }
    }
}

