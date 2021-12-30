//
//  CustomLabel.swift
//  BankManagerUIApp
//
//  Created by 이차민 on 2021/12/30.
//

import UIKit

class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(order: Int, type: Task) {
        super.init(frame: CGRect.zero)
        self.text = "\(order) - \(type)"
        self.textColor = type == .deposit ? .black : .purple
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
