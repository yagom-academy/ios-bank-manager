//
//  TaskTimerLabel.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/14.
//

import UIKit

final class TaskTimerLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    private func configure() {
        self.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
        self.font = UIFont.preferredFont(forTextStyle: .title2)
        self.text = "업무시간 - 00 : 00 : 000"
    }
}
