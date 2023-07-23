//
//  CustomerView.swift
//  BankManagerUIApp
//
//  Created by kyungmin on 2023/07/20.
//

import UIKit

final class CustomerView: UILabel {
    func configureUI(waitingNumber: Int, purpose: String, color: UIColor) {
        self.text = "\(waitingNumber) - \(purpose)"
        self.textColor = color
        self.textAlignment = .center
    }
}
