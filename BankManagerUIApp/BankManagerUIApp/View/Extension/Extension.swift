//
//  Extension.swift
//  BankManagerUIApp
//
//  Created by Rowan on 2023/03/15.
//

import UIKit

extension UIView {
    func setAutoLayoutConstraint(equalTo superView: UILayoutGuide) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            self.topAnchor.constraint(equalTo: superView.topAnchor),
            self.bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
}
