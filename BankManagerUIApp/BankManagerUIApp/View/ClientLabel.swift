//
//  ClientLabel.swift
//  BankManagerUIApp
//
//  Created by vetto, kokkilE on 2023/03/17.
//

import UIKit

final class ClientLabel: UILabel {
    let client: BankClient
    
    init(_ client: BankClient) {
        self.client = client

        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
