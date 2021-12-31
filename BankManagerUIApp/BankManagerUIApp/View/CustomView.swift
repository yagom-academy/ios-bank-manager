//
//  CustomView.swift
//  BankManagerUIApp
//
//  Created by yeha on 2021/12/31.
//

import UIKit

class CustomView: UIView {
    let clientIdentifierLabel = UILabel()
    let taskTypeLabel = UILabel()
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 150, height: 20)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initializeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initializeView()
    }
    
    func initializeView() {
        setupLabel(label: clientIdentifierLabel)
        setupLabel(label: taskTypeLabel)
        setupLabelConstraint()
        clientIdentifierLabel.textAlignment = .right
        taskTypeLabel.textAlignment = .left
    }
        
    func setupLabel(label: UILabel) {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLabelText(clientNumber: String, taskType: String) {
        clientIdentifierLabel.text = "\(clientNumber) -"
        taskTypeLabel.text = " \(taskType)"
    }
    
    func setupLabelConstraint() {
        clientIdentifierLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        clientIdentifierLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        clientIdentifierLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        clientIdentifierLabel.trailingAnchor.constraint(equalTo: taskTypeLabel.leadingAnchor).isActive = true
        taskTypeLabel.topAnchor.constraint(equalTo: clientIdentifierLabel.topAnchor).isActive = true
        taskTypeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        taskTypeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    }
}
