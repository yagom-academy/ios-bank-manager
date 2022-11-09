//
//  BankManagerUIApp - MainView.swift
//  Created by Ayaan, Som, Dragon.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class MainStackView: UIStackView {
    let buttonStackView: ButtonStackView = ButtonStackView()
    private let bankStateStackView: BankStateStackView = BankStateStackView()
    private let customerQueueStackView: CustomerQueueStackView = CustomerQueueStackView()
    let stopWatchLabel: StopWatchLabel = StopWatchLabel()
    
    init() {
        super.init(frame: .zero)
        configure()
        setSubView()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        self.alignment = .fill
        self.distribution = .fill
        self.axis = .vertical
        self.translatesAutoresizingMaskIntoConstraints = false
        self.spacing = 15
    }
    
    private func setSubView() {
        self.addArrangedSubview(buttonStackView)
        self.addArrangedSubview(stopWatchLabel)
        self.addArrangedSubview(bankStateStackView)
        self.addArrangedSubview(customerQueueStackView)
    }
    
    func setConstraints(from view: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
}
