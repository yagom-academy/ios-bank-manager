//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    let mainStackView: MainStackView = MainStackView()
    var stopWatch: StopWatch = StopWatch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        view.addSubview(mainStackView)
        mainStackView.setConstraints(from: self.view)
        mainStackView.buttonStackView.addButton.addTarget(self,
                                                          action: #selector(tappedAddButton),
                                                          for: .touchUpInside)
        mainStackView.buttonStackView.resetButton.addTarget(self,
                                                            action: #selector(tappedResetButton),
                                                            for: .touchUpInside)
        stopWatch.setDelegate(to: mainStackView.stopWatchLabel)
    }
    
    @objc
    func tappedAddButton() {
        stopWatch.start()
    }
    
    @objc
    func tappedResetButton() {
        stopWatch.cancel()
    }
}
