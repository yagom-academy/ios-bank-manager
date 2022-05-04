//
//  BankView.swift
//  BankManagerUIApp
//
//  Created by Eddy, dudu.
//

import UIKit

final class BankView: UIView {
    private lazy var baseStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            buttonStackView,
            businessHoursLabel,
            workStateStackView,
            customerStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        
        return stackView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addCustomerbutton, resetButton])
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    lazy var addCustomerbutton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .caption2)
        
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .caption2)
        
        return button
    }()
    
    lazy var businessHoursLabel: UILabel = {
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
        let stackView = UIStackView(arrangedSubviews: [waitScrollView, workScrollView])
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var waitScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var workScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var waitStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        return stackView
    }()
    
    lazy var workStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
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
        addSubview(baseStackView)
        waitScrollView.addSubview(waitStackView)
        workScrollView.addSubview(workStackView)

        // MARK: - baseStackView
        
        NSLayoutConstraint.activate([
            baseStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            baseStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            baseStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            baseStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
        
        // MARK: - waitStackView
        
        NSLayoutConstraint.activate([
            waitStackView.topAnchor.constraint(equalTo: waitScrollView.topAnchor),
            waitStackView.bottomAnchor.constraint(equalTo: waitScrollView.bottomAnchor),
            waitStackView.leadingAnchor.constraint(equalTo: waitScrollView.leadingAnchor),
            waitStackView.trailingAnchor.constraint(equalTo: waitScrollView.trailingAnchor),
            waitStackView.widthAnchor.constraint(equalTo: waitScrollView.widthAnchor)
        ])
        
        // MARK: - workStackView
        
        NSLayoutConstraint.activate([
            workStackView.topAnchor.constraint(equalTo: workScrollView.topAnchor),
            workStackView.bottomAnchor.constraint(equalTo: workScrollView.bottomAnchor),
            workStackView.leadingAnchor.constraint(equalTo: workScrollView.leadingAnchor),
            workStackView.trailingAnchor.constraint(equalTo: workScrollView.trailingAnchor),
            workStackView.widthAnchor.constraint(equalTo: workScrollView.widthAnchor)
        ])
    }
}
