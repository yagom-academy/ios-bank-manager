//
//  WaitingQueueLabel.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/14.
//

import UIKit

class WaitingQueueLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
        self.font = UIFont.preferredFont(forTextStyle: .title1)
        self.text = "대기중"
        self.textColor = .white
        self.backgroundColor = .systemGreen
    }
    
}
