//
//  MainView.swift
//  BankManagerUIApp
//
//  Created by 허윤영 on 04/05/2022.
//

import UIKit

final class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubviews()
        setConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

    // MARK: UIComponents - UIStackView
    
    private lazy var baseVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually

        return stackView
    }()
    
    private lazy var workTimerStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 3
        
        return stackView
    }()
    
    private lazy var statusStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
    
    private lazy var addClientButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor( .systemBlue, for: .normal)
        
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        
        return button
    }()
    
    
    // MARK: UIComponents - Label
    
    private lazy var workTimeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "업무시간 - "
        label.textColor = .black
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var workTimerLabel: UILabel = {
        let label = UILabel()
        
        label.text = "00:00:00"
        label.textColor = .black
        label.textAlignment = .left
        
        return label
    }()

    private lazy var waitingLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .green
        
        return label
    }()
    
    private lazy var workingLabel: UILabel = {
       let label = UILabel()
        label.text = "업무중"
        label.backgroundColor = .blue
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()

    // MARK: addSubViews
    
    private func addSubviews() {
        addSubview(baseVerticalStackView)
        
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
        
        baseVerticalStackView.addArrangedSubview(buttonStackView)
        baseVerticalStackView.addArrangedSubview(workTimerStackView)
        baseVerticalStackView.addArrangedSubview(statusStackView)
        baseVerticalStackView.addArrangedSubview(clientStackView)
    }
    
    
    // MARK: constraints
    
    private func setConstraints() { 
        NSLayoutConstraint.activate([
            baseVerticalStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            baseVerticalStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            baseVerticalStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            baseVerticalStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            waitingClientStackView.topAnchor.constraint(equalTo: waitingClientScrollView.contentLayoutGuide.topAnchor, constant: 0),
            waitingClientStackView.bottomAnchor.constraint(equalTo: waitingClientScrollView.contentLayoutGuide.bottomAnchor, constant: 0),
            waitingClientStackView.widthAnchor.constraint(equalTo: waitingClientScrollView.contentLayoutGuide.widthAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            workingClientStackView.topAnchor.constraint(equalTo: workingClientScrollView.contentLayoutGuide.topAnchor, constant: 0),
            workingClientStackView.bottomAnchor.constraint(equalTo: workingClientScrollView.contentLayoutGuide.bottomAnchor, constant: 0),
            workingClientStackView.widthAnchor.constraint(equalTo: workingClientScrollView.contentLayoutGuide.widthAnchor, constant: 0)
        ])
    }

}

