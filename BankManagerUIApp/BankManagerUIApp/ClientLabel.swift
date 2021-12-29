//
//  ClientView.swift
//  BankManagerUIApp
//
//  Created by 박병호 on 2021/12/29.
//

import UIKit

class ClientLabel: UILabel {

    init(client: Client) {
        super.init(frame: CGRect())
        text = "\(client.waitingNumber) - \(client.business)"
        
        if client.business == .loan {
            textColor = .systemPurple
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
