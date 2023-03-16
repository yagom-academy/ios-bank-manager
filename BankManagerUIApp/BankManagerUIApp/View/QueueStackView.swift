//
//  QueueStackView.swift
//  BankManagerUIApp
//
//  Created by 강민수 on 2023/03/13.
//

import UIKit

final class QueueStackView: UIStackView {
    let subStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addLabel(customer: Customer) {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = false
        label.text = "\(customer.waitingNumber) - \(customer.desiredBanking)"
        label.textColor = customer.fontColor
        label.font = .preferredFont(forTextStyle: .title3)
        label.numberOfLines = 1
        
        subStackView.addArrangedSubview(label)
    }
    
    func removeLabel(customer: Customer) {
        let newCustomer = "\(customer.waitingNumber) - \(customer.desiredBanking)"
        
        subStackView.arrangedSubviews.forEach { label in
            guard let oldLabel = label as? UILabel else { return }
            
            if newCustomer == oldLabel.text {
                subStackView.removeArrangedSubview(oldLabel)
                oldLabel.removeFromSuperview()
                
                return
            }
        }
    }
    
    func resetLabel() {
        subStackView.arrangedSubviews.forEach { label in
            subStackView.removeArrangedSubview(label)
            label.removeFromSuperview()
        }
    }
    
    func createTitleLabel(_ text: String, backgroundColor: UIColor) {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = false
        label.text = text
        label.font = .preferredFont(forTextStyle: .title1)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = backgroundColor
        
        self.addArrangedSubview(label)
        
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        
        createLabelStackView()
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
}
