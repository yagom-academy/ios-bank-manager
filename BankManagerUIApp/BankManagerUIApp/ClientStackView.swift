//
//  ClientStackView.swift
//  BankManagerUIApp
//
//  Created by vetto, kokkilE on 2023/03/14.
//

import UIKit

final class ClientStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.axis = .vertical
        self.spacing = 8
    }
    
    func setAutoLayout() {
        guard let superScrollView = superview else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.bottomAnchor.constraint(equalTo: superScrollView.bottomAnchor),
            self.topAnchor.constraint(equalTo: superScrollView.topAnchor),
            self.widthAnchor.constraint(equalTo: superScrollView.widthAnchor)
        ])
    }

    func addClient() {
        for index in 1...40 {
            let label: UILabel = .init()
            label.text = "\(index)-예금"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 24)
            
            if index % 2 == 0 {
                label.textColor = .systemPurple
            }
            
            self.addArrangedSubview(label)
        }
    }
}
