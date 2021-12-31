//
//  StateLabel.swift
//  BankManagerUIApp
//
//  Created by 이차민 on 2021/12/31.
//

import UIKit

class StateLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(text: String) {
        super.init(frame: CGRect.zero)
        self.text = text
        self.textColor = .white
        self.textAlignment = .center
        self.backgroundColor = text == "대기중" ? .systemGreen : .systemIndigo
        self.font = .preferredFont(forTextStyle: .title1)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
