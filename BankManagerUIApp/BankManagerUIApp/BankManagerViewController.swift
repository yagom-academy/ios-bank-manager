//
//  BankManagerUIApp - BankManagerViewController.swift
//  Created by brody, christy, harry.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class BankManagerViewController: UIViewController {
    private let controlPanelStackView = ControlPanelStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(controlPanelStackView)
        setUpStackViewLayoutConstraint()
    }
    
    private func setUpStackViewLayoutConstraint() {
        NSLayoutConstraint.activate([
            controlPanelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            controlPanelStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            controlPanelStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            controlPanelStackView.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.height/6)
        ])
    }
}
