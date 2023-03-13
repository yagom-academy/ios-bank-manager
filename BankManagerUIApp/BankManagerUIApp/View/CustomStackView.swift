//
//  CustomStackView.swift
//  BankManagerUIApp
//
//  Created by 김성준 on 2023/03/13.
//

import UIKit

class CustomStackView: UIStackView {

    
    func configureLayout() {
        self.distribution = .fill
        self.axis = .horizontal
    }

}
