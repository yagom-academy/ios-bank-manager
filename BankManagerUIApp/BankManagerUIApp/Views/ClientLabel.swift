//
//  ClientLabel.swift
//  BankManagerUIApp
//
//  Created by Wonbi on 2022/11/13.
//

import UIKit

final class ClientLabel: UILabel {
    private(set) var client: Client
    
    init(client: Client) {
        self.client = client
        super.init(frame: CGRect())
        
        setupLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        text = "\(client.waitingTicket) - \(client.purpose.name)"
        textColor = client.purpose == .deposit ? .black : .systemPurple
        translatesAutoresizingMaskIntoConstraints = false
    }
}
