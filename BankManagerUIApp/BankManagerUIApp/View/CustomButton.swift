//
//  CustomButton.swift
//  BankManagerUIApp
//
//  Created by 레옹아범, 혜모리 on 2023/03/13.
//

import UIKit

final class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.titleLabel?.font = .preferredFont(forTextStyle: .body)
        self.titleLabel?.adjustsFontForContentSizeCategory = true
        self.titleLabel?.numberOfLines = 1
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
