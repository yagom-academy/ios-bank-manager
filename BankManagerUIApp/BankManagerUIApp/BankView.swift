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
        addMainStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
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
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()
}

extension BankView {
    private func addMainStackView() {
        self.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
