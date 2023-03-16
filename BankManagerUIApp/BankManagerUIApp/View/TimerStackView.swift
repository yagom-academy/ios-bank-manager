//
//  TimerStackView.swift
//  BankManagerUIApp
//
//  Created by vetto, kokkilE on 2023/03/16.
//

import UIKit

final class TimerStackView: UIStackView {
    private let totalTime: UILabel = .init()
    private var timer = Timer()
    private var startTime: CFAbsoluteTime = .zero
    private var currentTime: CFAbsoluteTime = .zero
    private var previousTime: CFAbsoluteTime = .zero
    
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
    
    func startTimer() {
        if timer.isValid { return }
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(measureTime), userInfo: nil, repeats: true)
        
        startTime = CFAbsoluteTimeGetCurrent()
        previousTime = currentTime
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    func clearTimer() {
        totalTime.text = "00:00:000"
        timer.invalidate()
        previousTime = .zero
        currentTime = .zero
    }
    
    @objc private func measureTime() {
        currentTime = CFAbsoluteTimeGetCurrent() - startTime + previousTime
        
        let milliseconds = Int(currentTime * 1000) % 1000
        let seconds = (Int(currentTime * 1000) / 1000) % 60
        let minutes = (Int(currentTime * 1000) / (1000 * 60)) % 60
        
        totalTime.text = String(format: "%02d:%02d:%03d", minutes, seconds, milliseconds)
    }
}
