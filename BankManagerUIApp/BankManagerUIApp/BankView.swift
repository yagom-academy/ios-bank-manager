//
//  BankView.swift
//  BankManagerUIApp
//
//  Created by 쿼카, 두기 on 2022/05/04.
//

import UIKit

class BankView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    func setLabelText() {
//        self.addSubview(timerLabel)
//        greetLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        greetLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//    }
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    // MARK: - 추가 & 초기화 버튼
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    let addCustomerButtom: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    // MARK: - 타이머 라벨
    let timerLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    // MARK: - 대기중 & 업무중 라벨
    let stateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    let waitingLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let ingLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - 고객리스트 라벨
    let customerListStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    let waitingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    let ingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    let customerLabel: UILabel = {
        let label = UILabel()
        return label
    }()
}
