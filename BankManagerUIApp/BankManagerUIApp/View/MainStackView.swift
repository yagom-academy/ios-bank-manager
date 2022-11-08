//
//  BankManagerUIApp - MainView.swift
//  Created by Ayaan, Som, Dragon.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class MainStackView: UIStackView {
    private let buttonStackView: ButtonStackView = ButtonStackView()
    private let bankStateStackView: BankStateStackView = BankStateStackView()
    private let customerQueueStackView: CustomerQueueStackView = CustomerQueueStackView()
    private let timerLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "업무시간 - 00:00:000"
        
        return label
    }()
    
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
        self.addArrangedSubview(timerLabel)
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
