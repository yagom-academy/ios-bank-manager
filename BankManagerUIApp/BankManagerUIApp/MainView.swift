//
//  MainView.swift
//  BankManagerUIApp
//
//  Created by 우롱차, 민성 on 2022/05/06.
//

import UIKit

class MainView: UIView {

    let waitingClientVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    let workingClientVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let mainVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let topButtonHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "업무시간 - 0000"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let statusLabelHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let waitLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중"
        label.backgroundColor = .green
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let workingLabel: UILabel = {
        let label = UILabel()
        label.text = "업무중"
        label.backgroundColor = .blue
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bottomHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraintCustomView()
        
        
        //bankProcess.setBank(delegate: self)
        //addButton.addTarget(self, action: #selector(addClients), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        constraintCustomView()
    }
    
    func constraintCustomView() {
        self.addSubview(mainVerticalStackView)
        mainVerticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mainVerticalStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainVerticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainVerticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        mainVerticalStackView.addArrangedSubview(topButtonHorizontalStackView)
        topButtonHorizontalStackView.addArrangedSubview(addButton)
        topButtonHorizontalStackView.addArrangedSubview(resetButton)
        mainVerticalStackView.addArrangedSubview(timerLabel)
        statusLabelHorizontalStackView.addArrangedSubview(waitLabel)
        statusLabelHorizontalStackView.addArrangedSubview(workingLabel)
        mainVerticalStackView.addArrangedSubview(statusLabelHorizontalStackView)
        
        mainVerticalStackView.addArrangedSubview(bottomHorizontalStackView)
        bottomHorizontalStackView.addArrangedSubview(waitingClientVerticalStackView)
        bottomHorizontalStackView.addArrangedSubview(workingClientVerticalStackView)
        
        waitingClientVerticalStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        workingClientVerticalStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
    }
}

