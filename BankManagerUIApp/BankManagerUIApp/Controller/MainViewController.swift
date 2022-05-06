//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    private lazy var mainView = MainView(frame: self.view.frame)
    private lazy var bankProcess = BankProcess(bankDelegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view = mainView
        
        mainView.addButton.addTarget(self, action: #selector(addClients), for: .touchUpInside)
    }
    
    @objc func addClients() {
        bankProcess.addClientQueue()
    }
}

extension MainViewController: ViewControllerDelegate {
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
}
