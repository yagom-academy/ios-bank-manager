//
//  BankView.swift
//  BankManagerUIApp
//
//  Created by 쿼카, 두기 on 2022/05/04.
//

import UIKit

final class BankView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addMainStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - 추가 & 초기화 버튼
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(addCustomerButton)
        stackView.addArrangedSubview(resetButton)
        return stackView
    }()
    
    lazy var addCustomerButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    // MARK: - 타이머 라벨
    lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.text = "업무시간 - 00:00:00"
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textAlignment = .center
        return label
    }()
    // MARK: - 대기중 & 업무중 라벨
    private lazy var stateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(waitingLabel)
        stackView.addArrangedSubview(taskingLabel)
        return stackView
    }()
    
    private lazy var waitingLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중"
        label.textColor = .white
        label.backgroundColor = .systemGreen
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title1)
        return label
    }()
    
    private lazy var taskingLabel: UILabel = {
        let label = UILabel()
        label.text = "업무중"
        label.textColor = .white
        label.backgroundColor = .systemBlue
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title1)
        return label
    }()
    
    // MARK: - 고객리스트 라벨
    private lazy var customerListStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(waitingStackView)
        stackView.addArrangedSubview(taskingStackView)
        return stackView
    }()
    
    lazy var waitingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var taskingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView =  {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.addArrangedSubview(buttonStackView)
        stackView.addArrangedSubview(timerLabel)
        stackView.addArrangedSubview(stateStackView)
        stackView.addArrangedSubview(customerListStackView)
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
