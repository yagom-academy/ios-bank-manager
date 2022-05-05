//
//  MainView.swift
//  BankManagerUIApp
//
//  Created by 허윤영 on 04/05/2022.
//

import UIKit

final class MainView: BaseUIView {
    
    // MARK: UIComponents - UIStackView
    
    private lazy var superStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually

        return stackView
    }()
    
    private lazy var workTimerStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 3
        
        return stackView
    }()
    
    private lazy var statusStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var clientStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    lazy var waitingClientStackView: UIStackView = {
       let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 3
        
        return stackView
    }()
    
    lazy var workingClientStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 3
        
        return stackView
    }()
    
    // MARK: UIComponents - ScrollView
    
    lazy var waitingClientScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    lazy var workingClientScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    // MARK: UIComponents - UIButton
    
    lazy var addClientButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor( .systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        
        return button
    }()
    
    
    // MARK: UIComponents - Label
    
    private lazy var workTimeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "업무시간 - "
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private lazy var workTimerLabel: UILabel = {
        let label = UILabel()
        
        label.text = "00:00:00"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()

    private lazy var waitingLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .green
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private lazy var workingLabel: UILabel = {
       let label = UILabel()
        label.text = "업무중"
        label.backgroundColor = .blue
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()

    // MARK: addSubViews
    
    override func addSubviews() {
        addSubview(superStackView)
        
        buttonStackView.addArrangedSubview(addClientButton)
        buttonStackView.addArrangedSubview(resetButton)
        
        workTimerStackView.addArrangedSubview(workTimeLabel)
        workTimerStackView.addArrangedSubview(workTimerLabel)
        
        statusStackView.addArrangedSubview(waitingLabel)
        statusStackView.addArrangedSubview(workingLabel)
        
        workingClientScrollView.addSubview(workingClientStackView)
        waitingClientScrollView.addSubview(waitingClientStackView)
      
        clientStackView.addArrangedSubview(waitingClientScrollView)
        clientStackView.addArrangedSubview(workingClientScrollView)
        
        superStackView.addArrangedSubview(buttonStackView)
        superStackView.addArrangedSubview(workTimerStackView)
        superStackView.addArrangedSubview(statusStackView)
        superStackView.addArrangedSubview(clientStackView)
    }
    
    // MARK: constraints
    
    override func setConstraints() {
        NSLayoutConstraint.activate([
            superStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            superStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            superStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            superStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            waitingClientStackView.topAnchor.constraint(equalTo: waitingClientScrollView.contentLayoutGuide.topAnchor),
            waitingClientStackView.bottomAnchor.constraint(equalTo: waitingClientScrollView.contentLayoutGuide.bottomAnchor),
            waitingClientStackView.leadingAnchor.constraint(equalTo: waitingClientScrollView.contentLayoutGuide.leadingAnchor),
            waitingClientStackView.trailingAnchor.constraint(equalTo: waitingClientScrollView.contentLayoutGuide.trailingAnchor),
            waitingClientStackView.widthAnchor.constraint(equalTo: waitingClientScrollView.frameLayoutGuide.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            workingClientStackView.topAnchor.constraint(equalTo: workingClientScrollView.contentLayoutGuide.topAnchor),
            workingClientStackView.bottomAnchor.constraint(equalTo: workingClientScrollView.contentLayoutGuide.bottomAnchor),
            workingClientStackView.leadingAnchor.constraint(equalTo: workingClientScrollView.contentLayoutGuide.leadingAnchor),
            workingClientStackView.trailingAnchor.constraint(equalTo: workingClientScrollView.contentLayoutGuide.trailingAnchor),
            workingClientStackView.widthAnchor.constraint(equalTo: workingClientScrollView.contentLayoutGuide.widthAnchor)
        ])
    }
}
