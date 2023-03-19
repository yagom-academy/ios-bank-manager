//
//  BankManagerStackView.swift
//  BankManagerUIApp
//
//  Created by brody, christy, harry on 2023/03/14.
//

import UIKit

final class ControlPanelStackView: UIStackView {
    private let addCustomerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("고객 10명 추가", for: .normal)
        
        return button
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        
        return button
    }()
    
    private let controlButtonStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fillEqually
        stackView.alignment = .center

        return stackView
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        
        label.text = "업무시간 - 00:00:000"
        label.font = .preferredFont(forTextStyle: .title2)
        label.textAlignment = .center
        
        return label
    }()
    
    private let statusLabelStackView: UIStackView = {
        let waitLabel = UILabel()
        let processingLabel = UILabel()
        
        waitLabel.textColor = .white
        waitLabel.backgroundColor = .systemGreen
        waitLabel.text = "대기중"
        waitLabel.textAlignment = .center
        waitLabel.font = .preferredFont(forTextStyle: .largeTitle)
        
        processingLabel.textColor = .white
        processingLabel.backgroundColor = .systemIndigo
        processingLabel.text = "업무중"
        processingLabel.textAlignment = .center
        processingLabel.font = .preferredFont(forTextStyle: .largeTitle)
        
        let stackView = UIStackView(arrangedSubviews: [waitLabel, processingLabel])
        
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureControlPanelStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setControlButtonTarget(addAction: Selector, clearAction: Selector) {
        addCustomerButton.addTarget(nil, action: addAction, for: .touchUpInside)
        clearButton.addTarget(nil, action: clearAction, for: .touchUpInside)
    }
    
    func setTimerLabel() {
        guard let currentTime = timerLabel.text else { return }
        
        let splittedTime = currentTime
            .dropFirst(7)
            .split(separator: ":")
            .map { Int($0) }
            .compactMap { $0 }
        
        let minute = splittedTime[0], second = splittedTime[1], miliSecond = splittedTime[2]
        let time = minute * 60 * 1000 + second * 1000 + miliSecond + 1
        
        let newMinute = String(format: "%02d", time / 60 / 1000)
        let newSecond = String(format: "%02d", time % 60000 / 1000)
        let newMiliSecond = String(format: "%03d", time % 60000 % 1000)
        
        timerLabel.text = "업무시간 - \(newMinute):\(newSecond):\(newMiliSecond)"
    }
    
    func resetTimerLabel() {
        timerLabel.text = "업무시간 - 00:00:000"
    }
    
    private func configureControlPanelStackView() {
        self.axis = .vertical
        self.spacing = 10
        self.distribution = .fillEqually
        
        controlButtonStackView.addArrangedSubview(addCustomerButton)
        controlButtonStackView.addArrangedSubview(clearButton)
        
        self.addArrangedSubview(controlButtonStackView)
        self.addArrangedSubview(timerLabel)
        self.addArrangedSubview(statusLabelStackView)
    }
}
