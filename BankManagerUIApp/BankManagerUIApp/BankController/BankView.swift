//
//  BankView.swift
//  BankManagerUIApp
//
//  Created by Eddy, dudu.
//

import UIKit

class BankView: UIView {
    private lazy var baseStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            buttonStackView,
            businessHoursLabel,
            workStateStackView,
            customerStackView])
            
        stackView.axis = .vertical
        stackView.spacing = 15
        
        return stackView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addCustomerbutton, resetButton])
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var addCustomerbutton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        
        return button
    }()
    
    private lazy var businessHoursLabel: UILabel = {
        let label = UILabel()
        label.text = "업무시간 - 00:00:000"
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title3)
        
        return label
    }()
    
    private lazy var workStateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [waitLabel, workLabel])
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var waitLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title1)
        label.backgroundColor = .systemGreen
        
        return label
    }()
    
    private lazy var workLabel: UILabel = {
        let label = UILabel()
        label.text = "업무중"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title1)
        label.backgroundColor = .systemIndigo
        
        return label
    }()
    
    private lazy var customerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [waitStackView, workStackView])
        
        return stackView
    }()
    
    private lazy var waitStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private lazy var workStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - layout

extension BankView {
    private func layout() {
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(baseStackView)

        // MARK: - baseStackView
        
        NSLayoutConstraint.activate([
            baseStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            baseStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            baseStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            baseStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
