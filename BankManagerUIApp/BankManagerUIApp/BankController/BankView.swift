//
//  BankView.swift
//  BankManagerUIApp
//
//  Created by Eddy, dudu.
//

import UIKit

private enum Const {
    enum BaseStackView {
        static let spacing: CGFloat = 15
    }
    
    enum WaitStackView {
        static let spacing: CGFloat = 8
    }
    
    enum WorkStackView {
        static let spacing: CGFloat = 8
    }
    
    enum TimerStackView {
        static let spacing: CGFloat = 8
    }
    
    static let addButtonTitle = "고객 10명 추가"
    static let resetButtonTitle = "초기화"
    static let businessHourLabelText = "업무시간 -"
    static let waitLabelText = "대기중"
    static let workLabelText = "업무중"
    static let timerLabelText = "00:00:000"
}

final class BankView: UIView {
    private lazy var baseStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            buttonStackView,
            timerStackView,
            workStateStackView,
            customerStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Const.BaseStackView.spacing
        
        return stackView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addCustomerbutton, resetButton])
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    lazy var addCustomerbutton: UIButton = {
        let button = UIButton()
        button.setTitle(Const.addButtonTitle, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .caption2)
        
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle(Const.resetButtonTitle, for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .caption2)
        
        return button
    }()
    
    private lazy var timerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [businessHourLabel, timerLabel])
        stackView.distribution = .fillEqually
        stackView.spacing = Const.TimerStackView.spacing
        
        return stackView
    }()
    
    private lazy var businessHourLabel: UILabel = {
        let label = UILabel()
        label.text = Const.businessHourLabelText
        label.textAlignment = .right
        label.font = .preferredFont(forTextStyle: .title3)
        
        return label
    }()
    
    lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.text = Const.timerLabelText
        label.textAlignment = .left
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
        label.text = Const.waitLabelText
        label.textAlignment = .center
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title1)
        label.backgroundColor = .systemGreen
        
        return label
    }()
    
    private lazy var workLabel: UILabel = {
        let label = UILabel()
        label.text = Const.workLabelText
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
        stackView.spacing = Const.WaitStackView.spacing
        
        return stackView
    }()
    
    lazy var workStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Const.WorkStackView.spacing
        
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
