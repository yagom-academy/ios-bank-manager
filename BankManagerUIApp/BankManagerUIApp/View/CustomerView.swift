//
//  CustomerView.swift
//  BankManagerUIApp
//
//  Created by kyungmin on 2023/07/20.
//

import UIKit

final class CustomerView: UILabel {
    func configureUI(waitingNumber: Int, purpose: String) {
        self.text = "\(waitingNumber) - \(purpose)"
        self.textColor = .black
        self.textAlignment = .center
        
        if purpose == Customer.Work.loan.name {
            self.textColor = .systemPurple
        }
    }
}
