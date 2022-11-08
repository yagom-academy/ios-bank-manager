//
//  BankManagerUIApp - BankStateStackView.swift
//  Created by Ayaan, Som, Dragon.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class BankStateStackView: UIStackView {
    private let waitingLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "대기중"
        label.textColor = .white
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        return label
    }()
    
    private let workingLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "업무중"
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setSubView()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        self.alignment = .fill
        self.distribution = .fillEqually
        self.axis = .vertical
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setSubView() {
        self.addArrangedSubview(waitingLabel)
        self.addArrangedSubview(workingLabel)
    }
}
