//
//  CustomStackView.swift
//  BankManagerUIApp
//
//  Created by 이차민 on 2021/12/30.
//

import UIKit

class CustomStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: Distribution, alignment: Alignment) {
        super.init(frame: .zero)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.alignment = alignment
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
