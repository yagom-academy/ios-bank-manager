//
//  BankManagerUIApp - ViewController.swift
//  Created by Eddy, dudu.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

private enum Const {
    static let timeInterval = 0.003
    static let numberOfCusomter = 10
    static let businessHoursFormat = "%02d:%02d:%03.0f"
}

private extension UIStackView {
    func removeAllSubViews() {
        arrangedSubviews.forEach { subView in
            subView.removeFromSuperview()
        }
    }
    
    func addArrangedSubViews(_ views: [UIView]) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}

private extension Double {
    var formattedTime: String {
        let minute = Int(self / 60)
        let second = Int(self.truncatingRemainder(dividingBy: 60))
        let miliSecond = self.truncatingRemainder(dividingBy: 1) * 1000
            
        return String(format: Const.businessHoursFormat, minute, second, miliSecond)
    }
}

final class BankViewController: UIViewController {
    private lazy var bankView = BankView(frame: view.bounds)
    private let bank = Bank(loanWindow: BankLoanWindow(), depositWindow: BankDepositWindow())
    private var timer: Timer?
    private var seconds: Double = 0.0 {
        didSet {
            bankView.timerLabel.text = seconds.formattedTime
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        bind()
    }
}

extension BankViewController {
    private func attribute() {
        bankView.backgroundColor = .systemBackground
        bank.delegate = self
    }
    
    private func bind() {
        view = bankView
        bankView.addCustomerbutton.addTarget(self, action: #selector(addCustomerButtonTapped), for: .touchUpInside)
        bankView.resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addCustomerButtonTapped() {
        let customers = BankCustomer.make(startNumber: bank.waitingNumber, count: Const.numberOfCusomter)
        let customerViews = customers.map { CustomerView(customer: $0) }
        
        bankView.waitStackView.addArrangedSubViews(customerViews)
        
        bank.add(customers: customers)
        setTimer()
    }
    
    @objc private func resetButtonTapped() {
        seconds = 0.0
        resetTimer()
        
        bankView.workStackView.removeAllSubViews()
        bankView.waitStackView.removeAllSubViews()
        
        bank.reset()
    }
    
    private func setTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: Const.timeInterval, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
        }
    }
    
    private func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func startTimer() {
        seconds += Const.timeInterval
    }
}

extension BankViewController: BankDelegate {
    func bankWorkDidFinish(_ bank: Bank) {
        resetTimer()
    }
    
    func customerWorkDidStart(_ bank: Bank, id: String) {
        DispatchQueue.main.async {
            guard let customerViews = self.bankView.waitStackView.arrangedSubviews as? [CustomerView] else { return }
            
            guard let targetView = customerViews.filter({ customerView in
                customerView.customer.id == id
            }).first else { return }
            
            targetView.removeFromSuperview()
            self.bankView.workStackView.addArrangedSubview(targetView)
        }
    }
    
    func customerWorkDidFinish(_ bank: Bank, id: String) {
        DispatchQueue.main.async {
            guard let customerViews = self.bankView.workStackView.arrangedSubviews as? [CustomerView] else { return }
            
            guard let targetView = customerViews.filter({ customerView in
                customerView.customer.id == id
            }).first else { return }
            
            targetView.removeFromSuperview()
        }
    }
}
