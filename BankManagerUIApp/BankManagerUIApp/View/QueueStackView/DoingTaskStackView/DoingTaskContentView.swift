//
//  DoingTaskContentView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/14.
//

import UIKit

final class DoingTaskContentView: UIView {
    private let clientStackView = ClientStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpDoingTaskContentView()
        configureConstraint()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpDoingTaskContentView() {
        self.addSubview(clientStackView)
    }
    
    private func configureConstraint() {
        NSLayoutConstraint.activate([
            clientStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            clientStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            clientStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
