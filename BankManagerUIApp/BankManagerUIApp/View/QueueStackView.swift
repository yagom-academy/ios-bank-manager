//
//  QueueStackView.swift
//  BankManagerUIApp
//
//  Created by 강민수 on 2023/03/13.
//

import UIKit

class QueueStackView: UIStackView {
    let subStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createTitleLabel("업무중", backgroundColor: .systemIndigo)
        createLabelStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLabelStackView() {
        subStackView.translatesAutoresizingMaskIntoConstraints = false
        subStackView.axis = .vertical
        subStackView.distribution = .fill
        subStackView.alignment = .center
        subStackView.spacing = 8
        
        self.addArrangedSubview(subStackView)
        
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: subStackView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: subStackView.trailingAnchor)
        ])
    }
    
    private func createTitleLabel(_ text: String, backgroundColor: UIColor) {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = false
        label.text = text
        label.font = .preferredFont(forTextStyle: .title1)
        label.numberOfLines = 1
        label.textColor = .white
        label.backgroundColor = backgroundColor
        
        self.addArrangedSubview(label)
    }
    
    func addWaitingLabel() {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = false
        label.text = "1 - 예금"
        label.font = .preferredFont(forTextStyle: .title2)
        label.numberOfLines = 1
        
        subStackView.addArrangedSubview(label)
    }
}
