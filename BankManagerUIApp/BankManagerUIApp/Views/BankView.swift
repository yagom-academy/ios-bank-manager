//
//  BankView.swift
//  BankManagerUIApp
//
//  Created by kaki, songjun on 2023/03/14.
//

import UIKit

final class BankView: UIView {
    private let wholeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 15
        return stackView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    let addClientButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    let leadTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "업무시간"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let taskStatusLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let waitTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "대기중"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemGreen
        return label
    }()
    
    private let processTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "업무중"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        return label
    }()
    
    private let presentClientStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let waitClientStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    let processClientStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureUI() {
        let safeArea = self.safeAreaLayoutGuide
        
        self.addSubview(wholeStackView)
        self.addSubview(presentClientStackView)
        
        wholeStackView.addArrangedSubview(buttonStackView)
        wholeStackView.addArrangedSubview(leadTimeLabel)
        wholeStackView.addArrangedSubview(taskStatusLabelStackView)
        wholeStackView.addArrangedSubview(presentClientStackView)
        
        buttonStackView.addArrangedSubview(addClientButton)
        buttonStackView.addArrangedSubview(resetButton)
        
        taskStatusLabelStackView.addArrangedSubview(waitTaskLabel)
        taskStatusLabelStackView.addArrangedSubview(processTaskLabel)

        // autolayout
        NSLayoutConstraint.activate([
            wholeStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            wholeStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            wholeStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
}
