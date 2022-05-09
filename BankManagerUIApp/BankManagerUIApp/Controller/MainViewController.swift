//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    private lazy var mainView = MainView(frame: self.view.frame)
    private lazy var bankProcess = BankProcess(bankDelegate: self)
    private var timer: Timer!
    private var isTimerOn = false
    private var checkTime: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view = mainView
        
        mainView.addButton.addTarget(self, action: #selector(addClients), for: .touchUpInside)
        mainView.resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        timer = Timer.scheduledTimer(timeInterval: 0.01, target:self, selector:#selector(timerProc),userInfo:nil, repeats: true)
        
    }
    
    @objc func addClients() {
        bankProcess.addClientQueue()
    }
    
    @objc func reset() {
        isTimerOn = false
        checkTime = 0
        bankProcess = BankProcess(bankDelegate: self)
        
        mainView.waitingClientVerticalStackView.arrangedSubviews.forEach{
            mainView.waitingClientVerticalStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        mainView.workingClientVerticalStackView.arrangedSubviews.forEach{
            mainView.workingClientVerticalStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        mainView.timerLabel.text = "업무시간 : 00:00"
    }
    
    @objc func timerProc(timer:Timer){
        if isTimerOn {
            checkTime += 1
            let sec = checkTime / 60
            let milsec = checkTime % 60

            mainView.timerLabel.text = String(format: "업무시간 - %d:%02d", sec,milsec)
        }
    }
}

extension MainViewController: BankViewDelegate {
    func addWaitingClientLabel(text: String, color: UIColor) {
        let label = UILabel()
        label.textColor = color
        label.text = text
        label.textAlignment = .center
        
        mainView.waitingClientVerticalStackView.addArrangedSubview(label)
    }
    
    func addWorkingClientLabel(text: String, color: UIColor) {
        let label = mainView.waitingClientVerticalStackView.arrangedSubviews.filter{
            if let label = $0 as? UILabel, label.text == text {
                return true
            }
            return false
        }
        
        label.forEach{
            mainView.waitingClientVerticalStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
            mainView.workingClientVerticalStackView.addArrangedSubview($0)
        }
    }
    
    func removeWorkingClientLabel(text: String, color: UIColor) {
        let label = mainView.workingClientVerticalStackView.arrangedSubviews.filter{
            if let label = $0 as? UILabel, label.text == text {
                return true
            }
            return false
        }
        
        label.forEach{
            mainView.workingClientVerticalStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    func stopTimer() {
        isTimerOn = false
    }
    
    func startTimer() {
        isTimerOn = true
    }
}
