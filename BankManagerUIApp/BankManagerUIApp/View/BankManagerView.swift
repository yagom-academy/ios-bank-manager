//
//  BankManagerView.swift
//  BankManagerUIApp
//
//  Created by Donnie, Safari on 2022/05/04.
//

import UIKit

final class BankManagerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        configureMainStackViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var mainVerticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [buttonHorizontalStackView,
                                                  taskTimeLabel,
                                                  labelHorizontalStackView,
                                                  taskHorizontalStackView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 16
        return view
    }()
    
    private lazy var addCustomersButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        return button
    }()
    
    private lazy var buttonHorizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [addCustomersButton,
                                                  resetButton])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var taskTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "업무시간 - 00:00:000"
        label.font = .preferredFont(forTextStyle: .title2)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var waitingLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중"
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title1)
        label.backgroundColor = .systemGreen
        label.textAlignment = .center
        return label
    }()
    
    private lazy var workingLabel: UILabel = {
        let label = UILabel()
        label.text = "업무중"
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title1)
        label.backgroundColor = .systemIndigo
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelHorizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [waitingLabel,
                                                  workingLabel])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var waitingVerticalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fill
        return view
    }()
    
    private lazy var workingVerticalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fill
        return view
    }()
    
    private lazy var taskHorizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [waitingVerticalStackView,
                                                  workingVerticalStackView])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        return view
    }()
}

//MARK: - Auto Layout Method
private extension BankManagerView {
    func configureMainStackViewLayout() {
        self.addSubview(mainVerticalStackView)
        
        NSLayoutConstraint.activate([
            mainVerticalStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainVerticalStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mainVerticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainVerticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
