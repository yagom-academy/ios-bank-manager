//
//  extension+UIView.swift
//  BankManagerUIApp
//
//  Created by Rowan on 2023/03/15.
//

import UIKit

extension UIView {
    func setLayoutConstraint(toLayoutGuide layoutGuide: UILayoutGuide) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            self.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            self.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor)
        ])
    }
    
    func setLayoutConstraint(toView superView: UIView, needWidthAnchor: Bool = false) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            self.topAnchor.constraint(equalTo: superView.topAnchor),
            self.bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
        
        if needWidthAnchor == true {
            self.widthAnchor.constraint(equalTo: superView.widthAnchor).isActive = true
        }
    }
}
