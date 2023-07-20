//
//  CustomerView.swift
//  BankManagerUIApp
//
//  Created by kyungmin on 2023/07/20.
//

import UIKit

class CustomerView: UILabel {
    func configureUI(waitingNumber: Int, purpose: String) {
        self.text = "\(waitingNumber) - \(purpose)"
        self.textColor = .black
        self.textAlignment = .center
        
        if purpose == Bank.Work.loan.name {
            self.textColor = .systemPurple
        }
    }
}
