//
//  ClientStackView.swift
//  BankManagerUIApp
//
//  Created by vetto, kokkilE on 2023/03/14.
//

import Foundation
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
}
