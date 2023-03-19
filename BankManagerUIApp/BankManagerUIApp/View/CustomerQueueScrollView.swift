//
//  CustomerQueueScrollView.swift
//  BankManagerUIApp
//
//  Created by brody, christy, harry on 2023/03/14.
//

import UIKit

final class CustomerQueueScrollView: UIScrollView {
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.distribution = .fillEqually
        stackView.alignment = .top
        
        return stackView
    }()
    
    private let waitingQueueStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        
        return stackView
    }()
    
    private let processingQueueStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(contentStackView)
        configureContentStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addWaitingLabel(customers: [Customer]) {
        customers.forEach {
            self.waitingQueueStackView.addArrangedSubview(CustomerLabel($0))
        }
    }
    
    func moveToProcessingQueue(customer: Customer) {
        guard let label = self.waitingQueueStackView.viewWithTag(customer.waitingNumber) else {
            return
        }
        
        label.removeFromSuperview()
        
        self.processingQueueStackView.addArrangedSubview(label)
    }
    
    func removeFromProcessingQueue(customer: Customer) {
        guard let label = self.processingQueueStackView.viewWithTag(customer.waitingNumber) else {
            return
        }
        
        label.removeFromSuperview()
    }
    
    func resetAllStackView() {
        waitingQueueStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
        processingQueueStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func configureContentStackView() {
        contentStackView.addArrangedSubview(waitingQueueStackView)
        contentStackView.addArrangedSubview(processingQueueStackView)
        
        let contentLayoutGuide = self.contentLayoutGuide
        let frameLayoutGuide = self.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: frameLayoutGuide.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: frameLayoutGuide.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor)
        ])
    }
}
