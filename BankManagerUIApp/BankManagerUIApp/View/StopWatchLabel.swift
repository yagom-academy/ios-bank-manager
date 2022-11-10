//
//  BankManagerUIApp - StopWatchLabel.swift
//  Created by Ayaan, Som, Dragon.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class StopWatchLabel: UILabel {
    private var stopWatchTime: Double = 0.0 {
        didSet {
            setTime()
        }
    }
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.textAlignment = .center
        self.textColor = .black
        self.font = UIFont.preferredFont(forTextStyle: .title3)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = "업무시간 - 00:00:000"
    }
    
    func setTime() {
        let time: String = TimeCalculator.calculate(stopWatchTime)
        self.text = "업무시간 - \(time)"
    }
    
    func reset() {
        self.stopWatchTime = 0.0
    }
    
    func addOneMilliSecond() {
        self.stopWatchTime += 0.001
    }
}
