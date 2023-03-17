//
//  ClientStackView.swift
//  BankManagerUIApp
//
//  Created by vetto, kokkilE on 2023/03/14.
//

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
    
    func add(client: BankClient) {
        let label: ClientLabel = .init(client)
        label.text = "\(client.waitingNumber)-\(client.business.type)"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24)
        
        switch client.business {
        case .loan:
            label.textColor = .systemPurple
        case .deposit:
            label.textColor = .black
        }
        
        self.addArrangedSubview(label)
    }
    
    func remove(client: BankClient) {
        self.arrangedSubviews.forEach {
            if ($0 as? ClientLabel)?.client == client {
                $0.removeFromSuperview()
            }
        }
    }
    
    func clear() {
        self.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
