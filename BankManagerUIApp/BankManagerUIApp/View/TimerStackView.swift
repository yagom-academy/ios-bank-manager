//
//  TimerStackView.swift
//  BankManagerUIApp
//
//  Created by vetto, kokkilE on 2023/03/16.
//

import UIKit

final class TimerStackView: UIStackView, UpdateTimerDelegate {
    private let totalTime: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = 8
        
        let businessTime: UILabel = .init()
        businessTime.text = "업무 시간 - "
        businessTime.textAlignment = .right
        businessTime.font = .systemFont(ofSize: 24)
        
        totalTime.text = "00:00:000"
        totalTime.textAlignment = .left
        totalTime.font = .systemFont(ofSize: 24)
        
        self.addArrangedSubview(businessTime)
        self.addArrangedSubview(totalTime)
    }
    
    func updateTimeLabel(text: String) {
        totalTime.text = text
    }
}

