//
//  WaitingScrollView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/14.
//

import UIKit

final class WaitingScrollView: UIScrollView {
    let waitingClientStackView = WaitingClientStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpWaitingScrollView()
        configureConstraint()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpWaitingScrollView() {
        self.addSubview(waitingClientStackView)
    }
    
    private func configureConstraint() {
        NSLayoutConstraint.activate([
            waitingClientStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            waitingClientStackView.topAnchor.constraint(equalTo: self.topAnchor),
            waitingClientStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            waitingClientStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            waitingClientStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
